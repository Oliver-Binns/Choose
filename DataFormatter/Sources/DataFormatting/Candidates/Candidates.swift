import ArgumentParser
import Foundation
import SwiftCSV

struct Candidates: ParsableCommand {
    @Option(name: .shortAndLong, help: "Filepath for input CSV document")
    private var input: String = "candidate-data.csv"

    @Option(name: .shortAndLong, help: "Filepath for output JSON document")
    private var output: String = "candidate-data.json"

    mutating func run() throws {
        let inputURL = URL(fileURLWithPath: input)
        let csv = try CSV<Named>(url: inputURL)
        let candidateData = csv.rows.reduce(into: [String: [Candidate]]()) { dictionary, candidateData in
            let (constituency, candidate) = createCandidate(data: candidateData)
            dictionary[constituency, default: []].append(candidate)
        }

        let path = FileManager.default.currentDirectoryPath
        let url = URL(fileURLWithPath: path)
            .appendingPathComponent(output)

        let encoder = JSONEncoder()
        try encoder
            .encode(candidateData)
            .write(to: url, options: [])
    }

    func createCandidate(data: [String: String]) -> (String, Candidate) {
        guard
            let name = data[Column.name.rawValue],
            let party = data[Column.party.rawValue],
            let constituency = data[Column.constituency.rawValue] else {
            preconditionFailure("Invalid format for data")
        }

        let image = data[Column.photo.rawValue].flatMap(URL.init(string:))
        return (constituency, Candidate(name: name, image: image, party: party))
    }
}
