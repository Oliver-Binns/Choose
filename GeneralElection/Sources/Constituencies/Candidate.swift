import Foundation
import Parties

public struct Candidate: Codable {
    public let name: String
	public let image: URL?
    public let party: Party

    public init(name: String, image: URL?, party: Party) {
        self.name = name
        self.image = image
        self.party = party
    }
}

extension Candidate: Identifiable {
    public var id: String {
        name
    }
}

extension Candidate: Hashable { }

extension Candidate: CustomStringConvertible {
    public var description: String {
        "\(name), \(party)"
    }
}
