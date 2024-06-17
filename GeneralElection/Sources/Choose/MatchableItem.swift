import Foundation
import SwiftData

public protocol MatchableItem: PersistentModel {
    var id: UUID { get }
}
