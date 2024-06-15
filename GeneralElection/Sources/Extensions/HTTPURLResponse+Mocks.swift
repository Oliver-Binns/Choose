#if DEBUG
import Foundation

extension HTTPURLResponse {
    public static var success: Self {
        self.init(url: URL(string: "https://www.example.com")!,
                  statusCode: 200,
                  httpVersion: nil,
                  headerFields: nil)!
    }
}
#endif
