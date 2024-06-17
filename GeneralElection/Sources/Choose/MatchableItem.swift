import Foundation
import SwiftData

public protocol MatchableItem: PersistentModel {
    associatedtype Category: Hashable

    var id: UUID { get }
    var type: Category { get }

    static var sortDescriptors: [SortDescriptor<Self>] { get }
}
