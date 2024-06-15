import Foundation
import SwiftData

@Model
public final class Match {
    @Attribute(.unique) public let id: Int
    public let opinion: Opinion
    public let __opinion: String

    init(id: Int, opinion: Opinion) {
        self.id = id
        self.opinion = opinion
        self.__opinion = opinion.rawValue
    }
}
