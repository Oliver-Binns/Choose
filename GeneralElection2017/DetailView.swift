import Constituencies
import SwiftUI

struct DetailView: View {
    let candidate: Candidate
    let partyMapping: PartyMapping
    
    @State private var displayAttribution: Bool = false

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
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    displayAttribution.toggle()
                } label: {
                    Label("Info", systemImage: "info.circle.fill")
                        .labelStyle(.iconOnly)
                }
            }
        }
        .alert("Attribution",
               isPresented: $displayAttribution) {
            Button("Read more") {
                guard let aboutURL = URL(string: "https://candidates.democracyclub.org.uk/help/about") else {
                    return
                }
                UIApplication.shared.open(aboutURL)
            }
            Button("OK", role: .cancel) { }
        } message: {
            Text("""
            Candidate information is provided by Democracy Club under the Creative Commons licence.
            """)
        }
    }
}

#if DEBUG
#Preview {
    DetailView(candidate: .mock(),
               partyMapping: PartyMapping(likedPolicies: [], dislikedPolicies: []))
}
#endif
