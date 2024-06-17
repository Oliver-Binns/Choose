import ArgumentParser
import Foundation
import Policies
import SwiftData

struct Policies: ParsableCommand {
    @Option(name: .shortAndLong, help: "Filepath for output JSON document")
    private var output: String = "policy-data.json"

    func run() throws {
        let path = FileManager.default.currentDirectoryPath
        print("path", path)
        let url = URL(fileURLWithPath: path)
            .appendingPathComponent(output)

        print(url)

        let encoder = JSONEncoder()
        try encoder
            .encode(policies)
            .write(to: url, options: [])
    }
}
