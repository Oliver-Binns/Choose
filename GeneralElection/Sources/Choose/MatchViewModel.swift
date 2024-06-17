import Foundation
import SwiftData

@MainActor
@Observable
public final class MatchViewModel<Item: MatchableItem> {
    private let modelContext: ModelContext

    public var opinions: [Opinion: Set<UUID>] = [:]
    

    public init(modelContext: ModelContext) throws {
        self.modelContext = modelContext

        let matchedItems = try modelContext.fetch(FetchDescriptor<Match>())
        matchedItems.forEach {
            opinions[$0.opinion, default: []].insert($0.id)
        }
    }

    public func decide(opinion: Opinion, for item: Item) throws {
        opinions[opinion, default: []].insert(item.id)
        
        let match = Match(id: item.id, opinion: opinion)
        modelContext.insert(match)
        try modelContext.save()
    }

    public func reset() throws {
        try modelContext.delete(model: Match.self)
        opinions = [:]
    }
}
