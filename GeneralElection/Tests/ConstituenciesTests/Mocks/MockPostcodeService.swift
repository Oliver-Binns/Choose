@testable import Constituencies

final class MockPostcodeService: PostcodeService {
    func getPostcode() async throws -> String {
        "SW11 8AL"
    }
}
