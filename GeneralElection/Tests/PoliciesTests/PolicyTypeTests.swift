import XCTest
@testable import Policies

final class PolicyTypeTests: XCTestCase {
    func testImage() throws {
        PolicyType.allCases.forEach {
            XCTAssertNotNil($0.image, "\($0.rawValue) has no image set")
        }
    }
}
