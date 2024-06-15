import SwiftUI

struct FlippableCard<FrontContent: View, BackContent: View>: View {
    @Binding var isFlipped: Bool

    @State private var frontDegree: Double
    @State private var backDegree: Double

    @ViewBuilder
    var front: () -> FrontContent

    @ViewBuilder
    var back: () -> BackContent

    let durationAndDelay: Double = 0.3

    init(isFlipped: Binding<Bool>,
         @ViewBuilder front: @escaping () -> FrontContent,
         @ViewBuilder back: @escaping () -> BackContent) {
        self._isFlipped = isFlipped

        self.frontDegree = isFlipped.wrappedValue ? -90 : 0
        self.backDegree = isFlipped.wrappedValue ? 0 : 90

        self.front = front
        self.back = back
    }

    // MARK: View Body
    var body: some View {
        ZStack {
            Card(degrees: frontDegree, content: front)
            Card(degrees: backDegree, content: back)
        }
        .onChange(of: isFlipped) {
            if isFlipped {
                withAnimation(.easeIn(duration: durationAndDelay)) {
                    frontDegree = -90
                }
                withAnimation(.easeOut(duration: durationAndDelay).delay(durationAndDelay)) {
                    backDegree = 0
                }
            } else {
                withAnimation(.easeIn(duration: durationAndDelay)) {
                    backDegree = 90
                }
                withAnimation(.easeOut(duration: durationAndDelay).delay(durationAndDelay)) {
                    frontDegree = 0
                }
            }
        }
    }

    struct Card<Content: View>: View {
        var degrees: Double

        @ViewBuilder
        var content: () -> Content

        var body: some View {
            content()
                .rotation3DEffect(Angle(degrees: degrees), axis: (x: 0, y: 1, z: 0))
                .disabled(degrees == -90 || degrees == 90)
        }
    }
}
