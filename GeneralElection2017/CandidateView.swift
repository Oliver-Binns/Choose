import Constituencies
import SwiftUI

struct CandidateView: View {
    let candidate: Candidate

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                AsyncImage(url: candidate.image) { image in
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(8)
                } placeholder: {
                    Image(systemName: "person.crop.square.fill")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundColor(Color(uiColor: candidate.party.colour))
                }

                Image(uiImage: candidate.party.logo)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            }
            VStack(spacing: 0) {
                Text("Your candidate is").font(.body)
                Text(candidate.name)
                    .font(.title2).fontWeight(.semibold)
            }
        }
    }
}

#if DEBUG
#Preview {
    CandidateView(candidate: .mock())
        .padding()
}
#endif
