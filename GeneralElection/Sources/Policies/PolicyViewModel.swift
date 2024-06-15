import Observation
import SwiftData

@Observable
@MainActor
public final class PolicyViewModel {
    private let modelContext: ModelContext
    private let service: PolicyService

    public private(set) var policies: [Policy] = []

    public init(modelContext: ModelContext) {
        self.modelContext = modelContext
        self.service = PolicyService(modelContainer: modelContext.container)

        Task { try await initialLoad() }
    }

    private func initialLoad() async throws {
        try await service.loadAllPolicies()
    }
}
