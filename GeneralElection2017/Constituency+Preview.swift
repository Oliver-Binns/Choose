#if DEBUG
import Constituencies

extension Constituency {
    static func mock() -> Constituency {
        Constituency(name: "Halifax", candidates: .mock())
    }
}
#endif
