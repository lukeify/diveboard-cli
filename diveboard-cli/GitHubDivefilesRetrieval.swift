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
