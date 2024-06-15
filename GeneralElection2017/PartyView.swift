import Constituencies
import SwiftUI

struct PartyView: View {
    let candidate: Candidate
    let partyMapping: PartyMapping

    var agreement: Double {
        partyMapping.ratio
    }

    var body: some View {
        NavigationLink {
            DetailView(candidate: candidate,
                       partyMapping: partyMapping)
        } label: {
            ZStack {
                Image(uiImage: candidate.party.logo)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .padding()

                Circle()
                    .trim(from: 0, to: agreement)
                    .rotation(.degrees(-90))
                    .stroke(Color(candidate.party.colour), lineWidth: 3)

                Circle()
                    .trim(from: agreement, to: 1)
                    .rotation(.degrees(-90))
                    .stroke(Color(UIColor.secondarySystemBackground), lineWidth: 3)
            }
            .frame(height: 108)
        }
    }
}

#if DEBUG
#Preview {
    VStack {
        ForEach([0, 0.25, 0.75, 1], id: \.self) { _ in
            PartyView(candidate: .mock(),
                      partyMapping: PartyMapping(likedPolicies: [], dislikedPolicies: []))
        }
    }
}
#endif
