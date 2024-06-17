import Foundation
import SwiftData

final actor PolicyService: ModelActor {
    let modelContainer: ModelContainer
    let modelExecutor: any ModelExecutor

    let session: URLSession

    init(session: URLSession,
         modelContainer: ModelContainer) {
        self.session = session

        self.modelContainer = modelContainer
        let context = ModelContext(modelContainer)
        context.autosaveEnabled = false

        self.modelExecutor = DefaultSerialModelExecutor(modelContext: context)
    }

    init(modelContainer: ModelContainer) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession(configuration: config)
        self.init(session: session,
                  modelContainer: modelContainer)
    }

    private func loadModels(from data: Data) throws {
        let decoder = JSONDecoder()
        let policies = try decoder.decode([PolicyLite].self, from: data)
            .map(Policy.init)
        
        guard !policies.isEmpty else {
            // only update stored policies if we have new ones to replace with
            return
        }
        
        try modelContext.delete(model: Policy.self)
        
        policies.forEach {
            modelContext.insert($0)
        }

        try modelContext.save()
    }

    private func loadFromFile() throws {
        guard let url = Bundle.module.url(forResource: "policies", withExtension: "json") else {
            return
        }

        let data = try Data(contentsOf: url)
        try loadModels(from: data)
    }

    public func loadAllPolicies() async throws {
        try loadFromFile()
        let (data, _) = try await session.data(from: .policies)
        try loadModels(from: data)
    }
}
