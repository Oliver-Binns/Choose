import CoreLocationUI
import Constituencies
import SwiftData
import SwiftUI

struct ConstituencySelection: View {
    @Environment(ConstituencyViewModel.self)
    private var viewModel
    
    @State
    private var selectedConstituency: Constituency?

    @State
    private var errorMessage: String?

    var body: some View {
        VStack {
            LocationButton(.shareMyCurrentLocation) {
                Task {
                    do {
                        let constituency = try await viewModel.getConstituencyFromLocation()
                        withAnimation {
                            selectedConstituency = constituency
                        }
                    } catch LocationError.outsideUK {
                        print("outside UK, cannot get constituency")
                    } catch LocationError.permissionDenied {
                        print("location denied")
                    } catch {
                        print("error", error)
                    }
                }
            }
            .foregroundColor(.white)
            .font(.headline)
            .fontWeight(.semibold)
            .clipShape(.rect(cornerRadius: 4))

            Text("or")
                .font(.largeTitle)

            Picker(selection: $selectedConstituency) {
                ForEach(viewModel.constituencies) { constituency in
                    Text(constituency.name)
                        .tag(constituency as Constituency?)
                }
            } label: {

            }.pickerStyle(.wheel)

            Button {
                viewModel.selectedConstituency = selectedConstituency
            } label: {
                Label("Select", systemImage: "arrow.up.right")
            }
        }
    }
}

#if DEBUG
#Preview {
    ConstituencySelection()
        .environment(ConstituencyViewModel())
}
#endif
