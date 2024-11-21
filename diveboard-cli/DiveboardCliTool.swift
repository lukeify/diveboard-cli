//
//  main.swift
//  diveboard-cli
//
//  Created by Luke on 7/10/24.
//

import ArgumentParser

@main
struct DiveboardCliTool: ParsableCommand {
    static var configuration = CommandConfiguration(
        )
    
    
    @Argument(help: "The command to run using diveboard.")
    var command: DiveboardCommand
    
    @Option(name: .long, help: "The location to retrieve the divefiles repository from.")
    var source: DivefileRepositorySource = .github
    
    @Option(name: .long, help: "The GitHub account to use for a divefile repository.")
    var githubAccountIdentifier: String
    
    public func run() throws {
        switch source {
        case .github:
            GitHubDivefilesRetrieval.retrieve(identifier: githubAccountIdentifier)
        }
    }
}

enum DivefileRepositorySource: String, ExpressibleByArgument {
    case github = "github"
}

enum DiveboardCommand: String, ExpressibleByArgument {
    case apply = "apply"
}
