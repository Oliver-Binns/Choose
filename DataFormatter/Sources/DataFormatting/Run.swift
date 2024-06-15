import ArgumentParser

@main
struct Run: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Data Formatter",
        subcommands: [Candidates.self, Policies.self],
        defaultSubcommand: Policies.self
    )
}
