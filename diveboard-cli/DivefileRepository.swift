//
//  DivefileRepository.swift
//  diveboard-cli
//
//  Created by Luke on 13/10/24.
//

import Foundation

struct DivefileRepository {
    static func locationOnDisk() -> String {
        return "\(NSHomeDirectory())/.divefiles"
    }
}
