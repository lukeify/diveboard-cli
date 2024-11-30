//
//  ProcessExtensions.swift
//  diveboard-cli
//
//  Created by Luke on 14/10/24.
//

import Foundation

extension Process {
    private static let gitExecutable = URL(filePath: "/usr/bin/git")
    
    public func clone(identifier: String) throws {
        executableURL = Process.gitExecutable
        arguments = ["clone", "https://github.com/\(identifier)/divefiles.git", DivefileRepository.locationOnDisk()]
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
        arguments = ["-rf", DivefileRepository.locationOnDisk()]
        try run()
    }
}
