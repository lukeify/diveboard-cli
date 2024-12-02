//
//  LocalFileRetrieval.swift
//  diveboard-cli
//
//  Created by Luke on 02/12/2024.
//

import Foundation

class LocalDirectoryRetrieval {
    static func retrieve(path: String) {
        URL(filePath: path, directoryHint: .isDirectory)
    }
}
