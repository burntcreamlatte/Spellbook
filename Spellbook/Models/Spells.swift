//
//  Spells.swift
//  Spellbook
//
//  Created by Aaron Shackelford on 11/21/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable {
    let results: [Spell]
}
struct Spell: Codable {
    let name: String
    let url: String
}

//struct SpellInfo: Codable {
//    let desc: [String]
//    let components: [String]
//}
