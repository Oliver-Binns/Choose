#if DEBUG
import Choose
import Constituencies
import Policies
import SwiftData

extension ModelContainer {
    static var preview: ModelContainer {
        do {
            let container = try ModelContainer(
                for: Policy.self, Constituency.self,
                configurations: ModelConfiguration(isStoredInMemoryOnly: true)
            )

            return container
        } catch {
            fatalError("Failed to create preview container")
        }
    }
}

@MainActor
extension ConstituencyViewModel {
    convenience init() {
        let context = ModelContainer.preview
        self.init(modelContext: context.mainContext)
    }
}

@MainActor
extension PolicyViewModel {
    convenience init() {
        let context = ModelContainer.preview
        self.init(modelContext: context.mainContext)
    }
}

@MainActor
extension MatchViewModel {
    convenience init() {
        let context = ModelContainer.preview
        self.init(modelContext: context.mainContext)
    }
}
#endif
