//
//  GitHubDivefilesRetrieval.swift
//  diveboard-cli
//
//  Created by Luke on 13/10/24.
//

import Foundation

class GitHubDivefilesRetrieval {
    static func retrieve(identifier: String) {
        print("Cloning from repository \(identifier)/divefiles via GitHub")
        try! Process().clone(identifier: identifier)
        try! Process().rm()
    }
}

extension Process {
    private static let gitExecutable = URL(filePath: "/usr/bin/git")
    
    public func clone(identifier: String) throws {
        executableURL = Process.gitExecutable
        arguments = ["clone", "https://github.com/\(identifier)/divefiles.git", "/Users/luke/divefiles"]
        try run()
        waitUntilExit()
    }
    
    public func checkout(branchName: String) throws {
        executableURL = Process.gitExecutable
        arguments = ["checkout", branchName]
        try run()
        waitUntilExit()
    }
    
    public func rm() throws {
        executableURL = URL(filePath: "/bin/rm")
        arguments = ["-rf", "/Users/luke/divefiles"]
        try run()
    }
}
