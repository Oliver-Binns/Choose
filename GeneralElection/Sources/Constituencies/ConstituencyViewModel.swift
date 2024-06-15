import Foundation
import Observation
import SwiftData

@MainActor
@Observable
public final class ConstituencyViewModel {
    public var selectedConstituency: Constituency? {
        didSet {
            valueStore
                .set(selectedConstituency?.name, forKey: "constituency")
        }
    }

    private(set) public var constituencies: [Constituency] = []
    private(set) public var isLoading: Bool = true

    private let modelContext: ModelContext
    private let valueStore: ValueStore

    private let service: ConstituencyService

    init(apiKey: String,
         valueStore: ValueStore,
         modelContext: ModelContext) {
        self.valueStore = valueStore
        self.modelContext = modelContext

        self.service = ConstituencyService(apiKey: apiKey,
                                           modelContainer: modelContext.container)

        Task.detached(priority: .userInitiated) {
            try await self.service.loadAllConstituencies()
            try await self.initialLoad()
        }
    }

    private func initialLoad() throws {
        constituencies = try modelContext.fetch(
            FetchDescriptor<Constituency>(sortBy: [.init(\.name, order: .forward)])
        )
        isLoading = false

        guard let selectedConstituencyName = valueStore.string(forKey: "constituency") else {
            return
        }

        let fetchDescriptor = FetchDescriptor(predicate: #Predicate<Constituency> {
            $0.name == selectedConstituencyName
        })
        self.selectedConstituency = try? modelContext
            .fetch(fetchDescriptor).first
    }

    public convenience init(apiKey: String, modelContext: ModelContext) {
        self.init(apiKey: apiKey,
                  valueStore: UserDefaults.standard,
                  modelContext: modelContext)
    }

    public func getConstituencyFromLocation() async throws -> Constituency? {
        guard let identifier = try await service.getConstituencyFromLocation() else {
            return nil
        }
        return modelContext.registeredModel(for: identifier)
    }
}
