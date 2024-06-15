import Foundation
import SwiftData

@MainActor
@Observable
public final class MatchViewModel<Item: MatchableItem> {
    private let modelContext: ModelContext
    
    public var unmatched: [Item] = []
    
    public init(modelContext: ModelContext) {
        self.modelContext = modelContext
        
        try? updatePolicies()
    }
    
    private func updatePolicies() throws {
        let matchedItemCount = try modelContext
            .fetchCount(FetchDescriptor<Match>())
        
        var descriptor = FetchDescriptor<Item>(sortBy: Item.sortDescriptors)
        descriptor.fetchOffset = matchedItemCount
        descriptor.fetchLimit = 5
        self.unmatched = try modelContext.fetch(descriptor)
    }
    
    public func decide(opinion: Opinion, for item: Item) {
        let match = Match(id: item.id, opinion: opinion)
        modelContext.insert(match)
        try? modelContext.save()
        
        try? updatePolicies()
    }
    
    public func reset() throws {
        try modelContext.delete(model: Match.self)
        
        try? updatePolicies()
    }
}
