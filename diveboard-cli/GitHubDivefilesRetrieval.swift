//
//  GitHubDivefilesRetrieval.swift
//  diveboard-cli
//
//  Created by Luke on 13/10/24.
//

import Foundation

class GitHubDivefilesRetrieval {
    static func retrieve(identifier: String) {
        try! Process().clone()
        try! Process().rm()
    }
}

extension Process {
    private static let gitExecutable = URL(filePath: "/usr/bin/git")
    
    public func clone() throws {
        print("running clone")
        executableURL = Process.gitExecutable
        arguments = ["clone", "https://github.com/lukeify/divefiles.git", "/Users/luke/divefiles"]
        try run()
        waitUntilExit()
    }
    
    public func rm() throws {
        print("Running rm")
        executableURL = URL(filePath: "/bin/rm")
        arguments = ["-rf", "/Users/luke/divefiles"]
        try run()
    }
}
