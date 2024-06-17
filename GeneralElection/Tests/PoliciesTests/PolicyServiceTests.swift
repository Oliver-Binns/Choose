import Extensions
import SwiftData
import XCTest

@testable import Policies

final class PolicyServiceTests: XCTestCase {
    private var modelContext: ModelContext!
    private var sut: PolicyService!

    override func setUpWithError() throws {
        super.setUp()

        let modelConfiguration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Policy.self, configurations: modelConfiguration)
        modelContext = ModelContext(container)

        let config = URLSessionConfiguration.default
        config.protocolClasses = [
            MockURLProtocol.self
        ]

        let session = URLSession(configuration: config)
        sut = .init(session: session,
                    modelContainer: container)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}

extension PolicyServiceTests {
    func testGetPolicies() async throws {
        MockURLProtocol.requestHandler = { _ in
            try (.success, Data(filename: "policy", bundle: .module))
        }

        try await sut.loadAllPolicies()

        let descriptor = FetchDescriptor<Policy>(sortBy: [
            SortDescriptor(\.id, order: .forward)
        ])
        let policies = try modelContext
            .fetch(descriptor)

        XCTAssertEqual(policies.count, 6)

        let policy = try XCTUnwrap(policies.first)
        XCTAssertEqual(policy.id, UUID(uuidString: "40FF1752-0E42-4073-860D-0DA17CF55787"))
        XCTAssertEqual(policy.text,
                       "Leave both the EU Single Market and Customs Union.")
        XCTAssertEqual(policy.parties, [.conservatives])
        XCTAssertEqual(policy.type, .foreignAffairs)
    }

    func testAddPoliciesWithEmptyData() async throws {
        let data = try JSONEncoder()
            .encode([PolicyLite]())

        MockURLProtocol.requestHandler = { _ in
            (.success, data)
        }

        try await sut.loadAllPolicies()

        let descriptor = FetchDescriptor<Policy>(sortBy: [
            SortDescriptor(\.id, order: .forward)
        ])
        let policies = try modelContext
            .fetch(descriptor)

        XCTAssertEqual(policies.count, 54)
    }
}
