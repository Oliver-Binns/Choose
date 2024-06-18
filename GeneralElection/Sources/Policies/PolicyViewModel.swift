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
        print("searching for: ", toAdd)

        let nextPolicies = try findPolicies(count: toAdd, hiding: hiddenPolicies, parties: parties)
        print("adding: ", nextPolicies.count)
        policies.append(contentsOf: nextPolicies)
    }

    private func findPolicies(count: Int,
                              hiding hiddenPolicies: Set<UUID>,
                              parties: Set<Party>) throws -> [Policy] {
        let visible: Set<UUID> = Set(policies.map(\.id))

        var descriptor = FetchDescriptor<Policy>()
        descriptor.predicate = #Predicate {
            !hiddenPolicies.contains($0.id) &&
            !visible.contains($0.id)
        }

        return try modelContext
            .fetch(descriptor)
            .lazy
            .filter { !parties.isDisjoint(with: $0.parties) }
            .prefix(count)
            .map { $0 }
    }
}
