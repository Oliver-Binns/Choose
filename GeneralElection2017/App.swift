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
    @State var policyViewModel: PolicyViewModel?
    @State var constituencyViewModel: ConstituencyViewModel?
    @State var matchViewModel: MatchViewModel<Policy>?
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            if let policyViewModel,
               let constituencyViewModel,
               let matchViewModel {
                ContentView()
                    .environment(policyViewModel)
                    .environment(constituencyViewModel)
                    .environment(matchViewModel)
            } else {
                ProgressView()
                    .onAppear {
                        do {
                            constituencyViewModel = ConstituencyViewModel(modelContext: modelContext)
                            matchViewModel = try MatchViewModel(modelContext: modelContext)
                            policyViewModel = try PolicyViewModel(modelContext: modelContext)
                        } catch {
                            assertionFailure("error occured: \(error)")
                        }
                    }
            }
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
