import Extensions
import SwiftData
import XCTest

@testable import Constituencies

final class ConstituencyServiceTests: XCTestCase {
    private var modelContext: ModelContext!
    private var sut: ConstituencyService!

    override func setUpWithError() throws {
        super.setUp()

        let modelConfiguration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Constituency.self, configurations: modelConfiguration)
        modelContext = ModelContext(container)

        let config = URLSessionConfiguration.default
        config.protocolClasses = [
            MockURLProtocol.self
        ]

        let session = URLSession(configuration: config)
        sut = .init(session: session, apiKey: "test_key", locationService: MockPostcodeService(),
                    modelContainer: container)
    }

    override func tearDown() {
        sut = nil
        modelContext = nil
        super.tearDown()
    }
}

extension ConstituencyServiceTests {
    func testGetAllConstituenciesFromBundle() async throws {
        // Loading consituencies from bundle
        try await sut.loadAllConstituencies()

        // Loads all constituencies:
        let constituencies = FetchDescriptor<Constituency>()
        XCTAssertEqual(
            try modelContext.fetchCount(constituencies),
            650
        )

        // Correctly maps candidates to constituencies
        let halifax = try XCTUnwrap(modelContext.fetch(
            FetchDescriptor(predicate: #Predicate<Constituency> {
                $0.name == "Halifax"
            })
        ).first)

        XCTAssertEqual(halifax.name, "Halifax")
       // XCTAssertEqual(halifax.candidates.count, 6)
    }

    func testGetConstituency() async throws {
        // precondition:
        // - constituencies must be loaded into memory
        try await sut.loadAllConstituencies()

        var request: URLRequest?

        MockURLProtocol.requestHandler = {
            request = $0
            return try (.success, .init(filename: "constituency", bundle: .module))
        }

        guard let constituencyID = try await sut.getConstituency(postcode: "AB1 5HG") else {
            XCTFail("Expected a constituency ID to be returned")
            return
        }

        let url = try XCTUnwrap(request?.url)
        let components = try XCTUnwrap(URLComponents(url: url,
                                                     resolvingAgainstBaseURL: false))
        let postcode = components.queryItems?
            .first(where: { $0.name == "postcode" })?.value

        XCTAssertEqual(postcode, "AB1 5HG")

        let constituency = modelContext.model(for: constituencyID) as? Constituency
        XCTAssertEqual(constituency?.name, "Islington South and Finsbury")
    }
}
