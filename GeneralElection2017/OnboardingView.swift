import SwiftUI

struct OnboardingView: View {
    @AppStorage("OnboardingComplete")
    private var onboardingComplete: Bool?
    
    var body: some View {
        VStack(spacing: 4) {
            Image("Ballot")
                .resizable()
                .frame(maxWidth: 200, maxHeight: 200)
            
            Text("General Election 24")
                .font(.title)
                .fontWeight(.bold)
            
            Text("June 4th")
                .font(.title3)
                .fontWeight(.medium)
            
            Spacer()
            
            Button {
                withAnimation {
                    onboardingComplete = true
                }
            } label: {
                Text("Continue")
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .background(Image("Background").blur(radius: 70))
    }
}

#Preview {
    OnboardingView()
}
