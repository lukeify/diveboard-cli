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
        subcommands: [ApplyCommand.self]
        )
}

enum DivefileRepositorySource: String, ExpressibleByArgument {
    case github = "github"
    case local = "local"
}

struct ApplyCommand: ParsableCommand {
    static var configuration = CommandConfiguration(commandName: "apply")
        
    @Option(name: .long, help: "The location to retrieve the divefiles repository from.")
    var source: DivefileRepositorySource = .github
    
    @Option(name: .long, help: "The GitHub account to use for a divefile repository.")
    var githubAccountIdentifier: String?
    
    @Option(name: .long, help: "The directory to use as the divefile repository.")
    var localDirectoryPath: String?
    
    /// Validates for the given `source`, the correct dependent options are present.
    mutating public func validate() throws {
        switch source {
        case .local:
            if localDirectoryPath == nil {
                throw ValidationError("Please specify a directory for the divefile repository using --local-directory-path.")
            }
        case .github:
            if githubAccountIdentifier == nil {
                throw ValidationError("Please specify a GitHub account name to retrieve the `divefiles` repoistory from using --github-account-identifier.")
            }
        }
    }
    
    public func run() throws {
        switch source {
        case .github:
            GitHubDivefilesRetrieval.retrieve(identifier: githubAccountIdentifier!)
        case .local:
            LocalDirectoryRetrieval.retrieve(path: localDirectoryPath!)
        }
    }
    
}
