import Foundation

protocol ValueStore {
    func set(_ value: Any?, forKey: String)
    func string(forKey key: String) -> String?
}
extension UserDefaults: ValueStore { }
