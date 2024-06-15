#if DEBUG
import Foundation

public final class MockURLProtocol: URLProtocol {
    public static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?

    public override static func canInit(with request: URLRequest) -> Bool {
        true
    }

    public override static func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    public override func startLoading() {
        guard let handler = Self.requestHandler else {
            fatalError("Handler was not set.")
        }
        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)

            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }

            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    public override func stopLoading() {
        // This is called if the request gets canceled or completed.
    }
}
#endif
