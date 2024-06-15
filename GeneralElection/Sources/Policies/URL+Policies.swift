import Foundation

extension URL {
    private static var baseURL: URL {
        URL(string: "https://www.oliverbinns.co.uk/")!
    }

    static var policies: URL {
        baseURL
            .appendingPathComponent("election")
            .appendingPathComponent("policies.json")
    }
}
