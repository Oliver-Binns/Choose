import Choose
import Policies
import SwiftUI

struct PolicyView: View {
    let policy: Policy

    @Environment(MatchViewModel<Policy>.self)
    private var matchService

    @State private var offset = CGSize.zero

    var opacity: Double {
        3 - Double(abs(offset.distance / 100))
    }

    @MainActor
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                offset = gesture.translation
            }
            .onEnded { _ in
                withAnimation {
                    if offset.distance > 150 {
                        setOpinion()
                    } else {
                        offset = .zero
                    }
                }
            }
    }

    var opinion: Opinion {
        guard abs(offset.width) > abs(offset.height) else {
            return .ignore
        }
        return offset.width > 0 ? .agree : .disagree
    }

    var opinionColour: Color {
        switch opinion {
        case .agree:
            return .green
        case .disagree:
            return .red
        case .ignore:
            return .gray
        }
    }

    var body: some View {
        ZStack {
            Text(policy.text)
                .multilineTextAlignment(.center)
                .padding()
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black.opacity(0.5))

            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(opinionColour)
                .opacity(1 - opacity / 3)
        }
        .background(
            Image(uiImage: policy.type.image)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .clipped()
        )
        .cornerRadius(8)
        .padding()
        .shadow(radius: 10)
        .rotationEffect(.degrees(Double(offset.width / 10)))
        .offset(x: offset.width, y: min(0, offset.height))
        .opacity(opacity)
        .gesture(drag)
    }

    @MainActor
    private func setOpinion() {
        matchService.decide(opinion: opinion, for: policy)
    }
}

#if DEBUG
#Preview {
    PolicyView(policy: .mock())
}
#endif
