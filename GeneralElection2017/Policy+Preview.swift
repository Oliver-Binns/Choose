#if DEBUG
import Policies

extension Policy {
    static func mock() -> Policy {
        Policy(id: 123,
               text: "Test Policy",
               type: .environment,
               additionalInfo: nil,
               parties: [.green])
    }
}

#endif
