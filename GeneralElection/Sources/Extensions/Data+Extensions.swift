#if DEBUG
import Foundation

extension Data {
    public init(filename: String, bundle: Bundle) throws {
        guard let path = bundle.path(forResource: filename, ofType: "json") else {
            fatalError("Could not find file in bundle")
        }
        let url = URL(fileURLWithPath: path)
        self = try Data(contentsOf: url)
    }
}
#endif
