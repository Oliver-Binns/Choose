import Foundation
import Parties
import SwiftData

public enum ConstituencyServiceError: Error {
    case failedToFindResource
}

protocol PostcodeService {
    func getPostcode() async throws -> String
}

final actor ConstituencyService: ModelActor {
    let session: URLSession
    private let apiKey: String
    private let decoder: JSONDecoder
    
    private let locationService: PostcodeService
    
    let modelContainer: ModelContainer
    let modelExecutor: any ModelExecutor
    
    init(session: URLSession,
         apiKey: String,
         locationService: PostcodeService,
         modelContainer: ModelContainer) {
        self.session = session
        self.apiKey = apiKey
        self.decoder = JSONDecoder()
        self.locationService = locationService
        
        self.modelContainer = modelContainer
        
        let context = ModelContext(modelContainer)
        self.modelExecutor = DefaultSerialModelExecutor(modelContext: context)
    }
    
    init(apiKey: String, modelContainer: ModelContainer) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession(configuration: config)
        self.init(session: session,
                  apiKey: apiKey,
                  locationService: LocationService(),
                  modelContainer: modelContainer)
    }
}

// MARK: - Lookup Constituency
extension ConstituencyService {
    private struct ConstituencyLookupResponse: Decodable {
        let name: String
    }
    
    public func getConstituencyFromLocation() async throws -> PersistentIdentifier? {
        let postcode = try await locationService.getPostcode()
        return try await getConstituency(postcode: postcode)
    }
    
    func getConstituency(postcode: String) async throws -> PersistentIdentifier? {
        let (data, _) = try await session
            .data(from: .constituency(apiKey: apiKey, postcode: postcode))
        let name = try decoder.decode(ConstituencyLookupResponse.self, from: data).name
        
        let predicate = #Predicate<Constituency> { $0.name == name }
        return try modelContext.fetch(.init(predicate: predicate)).first?.persistentModelID
    }
}

// MARK: - Find Candidates
extension ConstituencyService {
    private struct CandidateLookup: Decodable {
        public let name: String
        public let image: URL?
        public let party: String
    }
    
    public func loadAllConstituencies() throws {
        guard let url = Bundle.module
            .url(forResource: "candidates", withExtension: "json") else {
            throw ConstituencyServiceError.failedToFindResource
        }
        let data = try Data(contentsOf: url)
        
        try decoder
            .decode([String: [CandidateLookup]].self, from: data)
            .forEach { (constituencyName, candidates) in
                let constituency = Constituency(
                    name: constituencyName,
                    candidates: candidates.compactMap { candidate -> Candidate? in
                    guard let party = Party(rawValue: candidate.party) else {
                        return nil
                    }
                    return Candidate(name: candidate.name,
                                     image: candidate.image,
                                     party: party)
                })
                modelContext.insert(constituency)
            }
        
        try modelContext.save()
    }
}
