//
//  Monster.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/5/23.
//

import Foundation

struct Monster: Hashable, Identifiable, Comparable {
    static func < (lhs: Monster, rhs: Monster) -> Bool {
        lhs.id < rhs.id
    }
    
    var id: Int
    var name: String
    var description: String
    var image: String
    var health: Int
    var range: Int
    var movement: Int
    var damageDie: [String]
    var specials: [String]
    var resistences: [String]
    var rockInStone: Bool
}
