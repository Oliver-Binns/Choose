import Foundation

extension URL {
    private static var theyWorkForYou: URL {
        URL(string: "https://www.theyworkforyou.com")!
            .appendingPathComponent("api")
    }
    
    static func constituency(apiKey: String, postcode: String) -> URL {
        guard var components = URLComponents(url: theyWorkForYou.appendingPathComponent("getConstituency"),
                                             resolvingAgainstBaseURL: false) else {
            preconditionFailure("Unable to generate components for the base URL")
        }
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "output", value: "js"),
            URLQueryItem(name: "postcode", value: postcode)
        ]
        return components.url!
    }
}
