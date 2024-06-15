import Constituencies
import Foundation
import SwiftData

extension ConstituencyViewModel {
    convenience init(modelContext: ModelContext) {
        guard let apiKey: String = try? Configuration.value(for: "API Key"),
              !apiKey.isEmpty else {
            fatalError("API Key missing. Please add GeneralElection.xcconfig file to parent directory.")
        }
        self.init(apiKey: apiKey, modelContext: modelContext)
    }
}

enum Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}
