import Foundation
import SwiftData

@Model
public final class Constituency {
    @Attribute(.unique) public let name: String
    public let candidates: [Candidate]

    public init(name: String, candidates: [Candidate]) {
        self.name = name
        self.candidates = candidates
    }
}

extension Constituency: Comparable {
    public static func < (lhs: Constituency, rhs: Constituency) -> Bool {
        lhs.name < rhs.name
    }
}
