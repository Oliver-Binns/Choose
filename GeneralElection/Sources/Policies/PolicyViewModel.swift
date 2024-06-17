import Foundation
import Observation
import Parties
import SwiftData

@Observable
@MainActor
public final class PolicyViewModel {
    private let modelContext: ModelContext
    private let service: PolicyService
    
    public private(set) var policies: [Policy] = []

    public init(modelContext: ModelContext) throws {
        self.modelContext = modelContext
        self.service = PolicyService(modelContainer: modelContext.container)

        Task { try await initialLoad() }
    }

    private func initialLoad() async throws {
        try await service.loadAllPolicies()
    }
    
    public func refreshPolicyList(for parties: Set<Party>,
                                  hiding hiddenPolicies: Set<UUID>) throws {
        policies = policies.filter { !hiddenPolicies.contains($0.id) }
        
        let toAdd = 5 - policies.count
        try policies.append(contentsOf: findPolicies(count: toAdd, hiding: hiddenPolicies, parties: parties))
    }
    
    private func findPolicies(count: Int = 5,
                              hiding hiddenPolicies: Set<UUID>,
                              parties: Set<Party>) throws -> [Policy] {
        var searched: Set<UUID> = Set(policies.map(\.id))
        
        var descriptor = FetchDescriptor<Policy>()
        descriptor.fetchLimit = 5
        descriptor.predicate = #Predicate {
            !hiddenPolicies.contains($0.id) &&
            !searched.contains($0.id)
        }
        
        var policies: [Policy] = []
        
        while policies.count < 5 {
            let possiblePolicies = try modelContext.fetch(descriptor)
            // ensure they don't get searched again
            possiblePolicies.map(\.id).forEach { searched.insert($0) }
            
            let allowedPolicies = possiblePolicies.filter { !parties.intersection($0.parties).isEmpty }
            // add to policy list
            policies.append(contentsOf: allowedPolicies)
            
            guard allowedPolicies.count > 0 else {
                return policies
            }
        }
        
        return policies
    }
}
