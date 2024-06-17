protocol MatchableItemProvider {
    associatedtype Item
    
    var items: [Item] { get }
}
