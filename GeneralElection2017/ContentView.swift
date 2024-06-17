import Choose
import Constituencies
import Policies
import SwiftUI

struct ContentView: View {
    @Environment(ConstituencyViewModel.self) private var constituencyViewModel
    @Environment(PolicyViewModel.self) private var policyViewModel
    @Environment(MatchViewModel<Policy>.self) private var matchViewModel

    @AppStorage("OnboardingComplete")
    private var onboardingComplete: Bool = false

    @MainActor
    private var isFlipped: Binding<Bool> {
        .init(get: {
            constituencyViewModel.selectedConstituency == nil
        }, set: { _ in })
    }
    
    

    var body: some View {
        if constituencyViewModel.isLoading {
            ProgressView()
        } else {
            MainView()
                .sheet(isPresented: isFlipped) {
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
                .onAppear {
                    updatePolicies()
                }
        }
    }
    
    @MainActor
    func updatePolicies() {
        withObservationTracking {
            do {
                let hiddenPolicies = matchViewModel.opinions.values.reduce(Set<UUID>()) { $1.union($0) }
                let availableParties = constituencyViewModel.selectedConstituency?.candidates.map(\.party) ?? []
                
                try policyViewModel.refreshPolicyList(for: Set(availableParties), hiding: hiddenPolicies)
            } catch {
                assertionFailure("error refreshing policies: \(error)")
            }
        } onChange: {
            Task {
                await MainActor.run {
                    updatePolicies()
                }
            }
        }
    }
}
