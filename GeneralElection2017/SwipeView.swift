import Choose
import Policies
import SwiftData
import SwiftUI

struct SwipeView: View {
    @Environment(PolicyViewModel.self)
    private var viewModel

    var body: some View {
        ZStack {
            if viewModel.policies.isEmpty {
                ContentUnavailableView(
                    "You have already swiped all the available policies.",
                    systemImage: "list.bullet.clipboard"
                )
            } else {
                ForEach(viewModel.policies.reversed()) { policy in
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
