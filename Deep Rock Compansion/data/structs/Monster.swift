//
//  Monster.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/5/23.
//

import Foundation

struct Monster: Identifiable {
    var id: Int
    var name: String
    var description: String
    var image: String
    var health: Int
    var range: Int
    var movement: Int
    var damageDie: Int
    var special: String
    var resistences: [String: Int]
}
