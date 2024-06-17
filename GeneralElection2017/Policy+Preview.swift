#if DEBUG
import Foundation
import Policies

extension Policy {
    static func mock() -> Policy {
        Policy(id: UUID(),
               text: "Test Policy",
               type: .environment,
               additionalInfo: nil,
               parties: [.green])
    }
}

#endif
