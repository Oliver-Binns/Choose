import Foundation
import Parties
import SwiftData

@Model
public final class Policy {
    @Attribute(.unique) public let id: UUID
    public let text: String
    public let additionalInfo: String?

    public let type: PolicyType
    public let parties: [Party]

    public init(id: UUID,
                text: String,
                type: PolicyType,
                additionalInfo: String?,
                parties: [Party]) {
        self.id = id
        self.text = text
        self.type = type
        self.additionalInfo = additionalInfo
        self.parties = parties
    }

    init(_ lite: PolicyLite) {
        self.id = lite.id
        self.text = lite.text
        self.type = lite.type
        self.additionalInfo = lite.additionalInfo
        self.parties = lite.parties
    }
}

extension Policy: Identifiable { }
extension Policy: CustomStringConvertible {
    public var description: String {
        text
    }
}
