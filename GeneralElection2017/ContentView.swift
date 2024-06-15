import Constituencies
import SwiftUI

struct ContentView: View {
    @Environment(ConstituencyViewModel.self)
    private var constituencyService

    @MainActor
    private var isFlipped: Binding<Bool> {
        .init(get: {
            constituencyService.selectedConstituency == nil
        }, set: { _ in })
    }

    var body: some View {
        if constituencyService.isLoading {
            ProgressView()
        } else {
            MainView().sheet(isPresented: isFlipped) {
                NavigationStack {
                    ConstituencySelection()
                        .navigationTitle("Select Constituency")
                }
                .interactiveDismissDisabled()
            }
        }
    }
}
