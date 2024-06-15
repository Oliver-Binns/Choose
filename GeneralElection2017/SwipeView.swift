import Choose
import Policies
import SwiftData
import SwiftUI

struct SwipeView: View {
    @Environment(MatchViewModel<Policy>.self)
    private var viewModel

    var body: some View {
        ZStack {
            if viewModel.unmatched.isEmpty {
                ContentUnavailableView(
                    "You have already swiped all the available policies.",
                    systemImage: "list.bullet.clipboard"
                )
            } else {
                ForEach(viewModel.unmatched.reversed()) { policy in
                    PolicyView(policy: policy)
                }
            }
        }
    }
}

#if DEBUG
#Preview {
    SwipeView()
}
#endif
