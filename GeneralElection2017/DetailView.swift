import Constituencies
import SwiftUI

struct DetailView: View {
    let candidate: Candidate
    let partyMapping: PartyMapping

    var body: some View {
        VStack {
            CandidateView(candidate: candidate)

            Divider()

            TabView {
                StatisticsView(opinion: .agree, data: partyMapping.agreement.groups)
                StatisticsView(opinion: .disagree, data: partyMapping.disagreement.groups)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .padding()
        .navigationTitle(candidate.party.name)
        .toolbarBackground(Color.black, for: .navigationBar)
    }
}

#if DEBUG
#Preview {
    DetailView(candidate: .mock(),
               partyMapping: PartyMapping(likedPolicies: [], dislikedPolicies: []))
}
#endif
