import Choose
import Constituencies
import Policies
import SwiftUI

struct MainView: View {
    @Environment(ConstituencyViewModel.self)
    private var constituencyService
    
    @Environment(MatchViewModel<Policy>.self)
    private var matchService
    
    @MainActor
    private var navigationTitle: String {
        constituencyService.selectedConstituency?.name ?? "Constituency"
    }

    var body: some View {
        VStack {
            SwipeView()
            Spacer()
            if let candidates = constituencyService.selectedConstituency?.candidates {
                PartiesView(candidates: Array(candidates))
            }
        }
        .navigationTitle(navigationTitle)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    constituencyService.selectedConstituency = nil
                } label: {
                    Label("Constituency", systemImage: "location.circle.fill")
                }
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    do {
                        try matchService.reset()
                    } catch {
                        print("Error resetting matches: \(error)")
                    }
                } label: {
                    Label("Clear", systemImage: "trash")
                }
            }
        }
    }
}

#if DEBUG
#Preview {
    MainView()
        .environment(ConstituencyViewModel())
        .environment(PolicyViewModel())
}
#endif
