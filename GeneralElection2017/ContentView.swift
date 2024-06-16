import Constituencies
import SwiftUI

struct ContentView: View {
    @Environment(ConstituencyViewModel.self)
    private var constituencyService

    @AppStorage("OnboardingComplete")
    private var onboardingComplete: Bool = false

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
                    OnboardingView()
                        .navigationDestination(isPresented: $onboardingComplete) {
                            ConstituencySelection()
                                .navigationTitle("Select Constituency")
                                .navigationBarTitleDisplayMode(.large)
                                .navigationBarBackButtonHidden(true)
                        }
                }
                .interactiveDismissDisabled()
            }
        }
    }
}
