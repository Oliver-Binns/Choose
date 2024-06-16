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
            
            Label("June 4th", systemImage: "calendar")
                .font(.title3)
                .fontWeight(.medium)
            
            TabView {
                OnboardingPage(
                    imageName: "location.fill.viewfinder",
                    text: "Select your constituency to get information relevant to your area."
                )
                
                OnboardingPage(
                    imageName: "hand.draw",
                    text: "Swipe right on policies you agree with. Swipe left on those you don't."
                )
                
                OnboardingPage(
                    imageName: "person.crop.circle.badge.questionmark.fill",
                    text: "Find out which parties you agree with, and who their candidates are."
                )
                
                OnboardingPage(
                    imageName: "chart.pie.fill",
                    text: "Find out which policies areas you agree and disagree on."
                )
            }
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 8))
            .padding()
            .tabViewStyle(.page)
            
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
