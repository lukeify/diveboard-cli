//
//  diveboard_cli_tests.swift
//  diveboard-cli-tests
//
//  Created by Luke on 02/12/2024.
//

import Testing
import ArgumentParser
@testable import diveboard_cli

@Suite("Arguments") struct DiveboardCliTests {
    @Test func localDirectorySourceRequiresLocalDirectoryPathOption() {
        let arguments = ["--source", "local"]
        #expect(throws: ValidationError.self) {
            var parsed = try DiveboardCliTool.parse(arguments)
            try parsed.validate()
        }
    }

}
