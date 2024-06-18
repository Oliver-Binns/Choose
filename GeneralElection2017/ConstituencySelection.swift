import Constituencies
import CoreLocationUI
import SwiftData
import SwiftUI

struct ConstituencySelection: View {
    @Environment(ConstituencyViewModel.self)
    private var viewModel

    @State
    private var selectedConstituency: Constituency?

    @State
    private var isLoadingLocation: Bool = false

    @State
    private var errorMessage: Bool = false

    @State
    private var showAttribution: Bool = false

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                LocationButton(.shareMyCurrentLocation) {
                    Task {
                        withAnimation {
                            isLoadingLocation = true
                        }

                        do {
                            let constituency = try await viewModel.getConstituencyFromLocation()
                            withAnimation {
                                selectedConstituency = constituency
                            }
                        } catch {
                            errorMessage = true
                        }

                        isLoadingLocation = false
                    }
                }
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.semibold)
                .clipShape(.rect(cornerRadius: 4))
                .disabled(isLoadingLocation)

                if isLoadingLocation {
                    ProgressView()
                } else {
                    Button {
                        showAttribution.toggle()
                    } label: {
                        Label("Info", systemImage: "info.circle.fill")
                            .labelStyle(.iconOnly)
                    }
                }
            }

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
        }.alert("Could not find constituency",
                isPresented: $errorMessage) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("""
            Could not find your constituency from your location.

            Please try again later or select manually.
            """)
        }
        .alert("Attribution", isPresented: $showAttribution) {
            Button("Read more") {
                guard let aboutURL = URL(string: "https://www.theyworkforyou.com/api/terms") else {
                    return
                }
                UIApplication.shared.open(aboutURL)
            }
            Button("OK", role: .cancel) { }
        } message: {
            Text("""
            Constituency location data service provided by TheyWorkForYou.
            """)
        }
    }
}

#if DEBUG
#Preview {
    ConstituencySelection()
        .environment(ConstituencyViewModel())
}
#endif
