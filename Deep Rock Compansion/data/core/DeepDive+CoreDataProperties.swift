//
//  DeepDive+CoreDataProperties.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/13/23.
//
//

import Foundation
import CoreData


extension DeepDive {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeepDive> {
        return NSFetchRequest<DeepDive>(entityName: "DeepDive")
    }

    @NSManaged public var lastSaved: Date?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var mollyInv: NSSet?
    @NSManaged public var players: NSSet?
    
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

// MARK: Generated accessors for mollyInv
extension DeepDive {

    @objc(addMollyInvObject:)
    @NSManaged public func addToMollyInv(_ value: Item)

    @objc(removeMollyInvObject:)
    @NSManaged public func removeFromMollyInv(_ value: Item)

    @objc(addMollyInv:)
    @NSManaged public func addToMollyInv(_ values: NSSet)

    @objc(removeMollyInv:)
    @NSManaged public func removeFromMollyInv(_ values: NSSet)

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
