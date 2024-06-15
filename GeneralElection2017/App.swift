import Choose
import Constituencies
import Policies
import SwiftData
import SwiftUI

@main
struct GeneralElection: App {
    var body: some Scene {
        WindowGroup {
            MainWindow()
        }
        .modelContainer(for: [Policy.self, Constituency.self, Match.self])
    }
}

struct MainWindow: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            ContentView()
                .environment(PolicyViewModel(modelContext: modelContext))
                .environment(ConstituencyViewModel(modelContext: modelContext))
                .environment(MatchViewModel<Policy>(modelContext: modelContext))
        }
    }
}

extension Policy: MatchableItem {
    public static var sortDescriptors: [SortDescriptor<Policies.Policy>] {
        [
            .init(\Policy.id, order: .forward)
        ]
    }
}
