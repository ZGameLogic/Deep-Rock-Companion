//
//  DeepDive.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 9/29/23.
//

import Foundation
import SwiftData

@Model
class DeepDive {
    var lastSaved: Date
    var name: String
    var players: [Player]
    
    init(lastSaved: Date, name: String, players: [Player]) {
        self.lastSaved = lastSaved
        self.name = name
        self.players = players
    }
}

@Model
class Player {
    var classType: String
    var health: Int
    var playerName: String
    var primaryAmmo: Int
    var secondaryAmmo: Int
    var primaryUpgrages: [Item]
    var rockInStones: [Item]
    var secondaryUpgrades: [Item]
    var throwables: [Item]
    var utilities: [Item]
    
    init(classType: String, health: Int, playerName: String, primaryAmmo: Int, secondaryAmmo: Int, primaryUpgrages: [Item], rockInStones: [Item], secondaryUpgrades: [Item], throwables: [Item], utilities: [Item]) {
        self.classType = classType
        self.health = health
        self.playerName = playerName
        self.primaryAmmo = primaryAmmo
        self.secondaryAmmo = secondaryAmmo
        self.primaryUpgrages = primaryUpgrages
        self.rockInStones = rockInStones
        self.secondaryUpgrades = secondaryUpgrades
        self.throwables = throwables
        self.utilities = utilities
    }
}

@Model
class Item {
    var amount: Int
    var name: String
    
    init(amount: Int, name: String) {
        self.amount = amount
        self.name = name
    }
}


