#if DEBUG
// swiftlint:disable line_length
import Constituencies
import Foundation

extension Candidate {
    static func mock() -> Candidate {
        Candidate(name: "Holly Lynch",
                  image: URL(string: "https://static-candidates.democracyclub.org.uk/media/cache/35/1c/351cb3791916c78c3a1ca63576285018.jpg"),
                  party: .labour)
    }
}

extension Array where Element == Candidate {
    static func mock() -> Self {
        [
            .init(name: "Kashif Ali",
                  image: nil,
                  party: .conservatives),
            .init(name: "James Baker",
                  image: URL(string: "https://static-candidates.democracyclub.org.uk/media/cache/f9/74/f974772bd03687f43762ce1a198fe97f.jpg"),
                  party: .liberalDemocrats),
            .init(name: "Bella Jessop",
                  image: nil,
                  party: .green),
            .mock(),
            .init(name: "Sarah Wood",
                  image: nil,
                  party: .reform)
        ]
    }
}
// swiftlint:enable line_length
#endif
