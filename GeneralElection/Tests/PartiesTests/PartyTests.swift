import XCTest
@testable import Parties

final class PartyTests: XCTestCase {
    func testColour() throws {
        Party.allCases.forEach {
            XCTAssertNotNil($0.colour, "\($0.name) has no colour set")
        }
    }

    func testLogo() throws {
        Party.allCases.forEach {
            XCTAssertNotNil($0.logo, "\($0.name) has no logo set")
        }
    }
}
