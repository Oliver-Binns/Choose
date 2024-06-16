import SwiftUI

struct OnboardingPage: View {
    let imageName: String
    let text: String

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .foregroundColor(.secondary)

            Text(text)
                .font(.headline)
                .multilineTextAlignment(.center)
        }.padding()
    }
}

#Preview {
    OnboardingPage(
        imageName: "location.fill.viewfinder",
        text: "Select your constituency to get information relevant to your area."
    )
}
