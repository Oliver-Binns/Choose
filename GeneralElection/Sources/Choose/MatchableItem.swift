import Foundation
import SwiftData

public protocol MatchableItem: PersistentModel {
    associatedtype Category: Hashable

    var id: Int { get }
    var type: Category { get }

    static var sortDescriptors: [SortDescriptor<Self>] { get }
}
