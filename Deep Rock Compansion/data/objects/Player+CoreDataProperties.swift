//
//  Player+CoreDataProperties.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/12/23.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var classType: String?
    @NSManaged public var health: Int16
    @NSManaged public var playerName: String?
    @NSManaged public var primaryAmmo: Int16
    @NSManaged public var secondaryAmmo: Int16
    @NSManaged public var primaryUpgrages: Item?
    @NSManaged public var rockInStones: Item?
    @NSManaged public var secondaryUpgrades: Item?
    @NSManaged public var throwables: Item?
    @NSManaged public var utilities: Item?

}

extension Player : Identifiable {

}
