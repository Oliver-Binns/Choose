import Foundation
import Parties

public struct PolicyLite: Codable {
    public let id: UUID
    public let text: String
    public let additionalInfo: String?

    public let type: PolicyType
    public let parties: [Party]

    public init(id: UUID,
                text: String,
                additionalInfo: String? = nil,
                type: PolicyType,
                parties: [Party]) {
        self.id = id
        self.text = text
        self.additionalInfo = additionalInfo
        self.type = type
        self.parties = parties
    }
}

extension PolicyLite {
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case type = "image"
        case additionalInfo
        case parties
    }
}
