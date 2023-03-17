//
//  DeepDive+CoreDataProperties.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/17/23.
//
//

import Foundation
import CoreData
import SwiftUI

extension DeepDive {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeepDive> {
        return NSFetchRequest<DeepDive>(entityName: "DeepDive")
    }

    @NSManaged public var lastSaved: Date
    @NSManaged public var name: String
    @NSManaged public var notes: String
    @NSManaged public var gold: Int16
    @NSManaged public var nitra: Int16
    @NSManaged public var players: NSSet
    
    public var deepDiveBinding: Binding<DeepDive> {
        Binding.init(get: {
            self
        }, set: { value in
            self.lastSaved = value.lastSaved
            self.name = value.name
            self.notes = value.notes
            self.gold = value.gold
            self.nitra = value.nitra
            self.players = value.players
        })
    }
    
    public func setPlayers(players: [Player]){
        self.players = NSSet(array: players)
    }
    
    public var playersBinding: Binding<[Player]> {
        Binding.init(get: {
            self.playersArray
        }, set: {value in
            self.players = NSSet(array: value)
        })
    }
    
    public var playersArray: [Player] {
        let set = players as? Set<Player> ?? []
        return set.sorted {
            if($0.playerName == $1.playerName){
                return $0.playerName! < $1.playerName!
            } else {
                return $0.playerName! < $1.playerName!
            }
        }
    }

}

// MARK: Generated accessors for players
extension DeepDive {

    @objc(addPlayersObject:)
    @NSManaged public func addToPlayers(_ value: Player)

    @objc(removePlayersObject:)
    @NSManaged public func removeFromPlayers(_ value: Player)

    @objc(addPlayers:)
    @NSManaged public func addToPlayers(_ values: NSSet)

    @objc(removePlayers:)
    @NSManaged public func removeFromPlayers(_ values: NSSet)

}

extension DeepDive : Identifiable {

}
