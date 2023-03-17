//
//  Card+CoreDataProperties.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/17/23.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var name: String?
    @NSManaged public var primaryUpgrage: NSSet?
    @NSManaged public var rockInStone: NSSet?
    @NSManaged public var secondaryUpgrages: NSSet?
    @NSManaged public var throwables: NSSet?
    @NSManaged public var utilities: NSSet?
    
    

}

// MARK: Generated accessors for primaryUpgrage
extension Card {

    @objc(addPrimaryUpgrageObject:)
    @NSManaged public func addToPrimaryUpgrage(_ value: Player)

    @objc(removePrimaryUpgrageObject:)
    @NSManaged public func removeFromPrimaryUpgrage(_ value: Player)

    @objc(addPrimaryUpgrage:)
    @NSManaged public func addToPrimaryUpgrage(_ values: NSSet)

    @objc(removePrimaryUpgrage:)
    @NSManaged public func removeFromPrimaryUpgrage(_ values: NSSet)

}

// MARK: Generated accessors for rockInStone
extension Card {

    @objc(addRockInStoneObject:)
    @NSManaged public func addToRockInStone(_ value: Player)

    @objc(removeRockInStoneObject:)
    @NSManaged public func removeFromRockInStone(_ value: Player)

    @objc(addRockInStone:)
    @NSManaged public func addToRockInStone(_ values: NSSet)

    @objc(removeRockInStone:)
    @NSManaged public func removeFromRockInStone(_ values: NSSet)

}

// MARK: Generated accessors for secondaryUpgrages
extension Card {

    @objc(addSecondaryUpgragesObject:)
    @NSManaged public func addToSecondaryUpgrages(_ value: Player)

    @objc(removeSecondaryUpgragesObject:)
    @NSManaged public func removeFromSecondaryUpgrages(_ value: Player)

    @objc(addSecondaryUpgrages:)
    @NSManaged public func addToSecondaryUpgrages(_ values: NSSet)

    @objc(removeSecondaryUpgrages:)
    @NSManaged public func removeFromSecondaryUpgrages(_ values: NSSet)

}

// MARK: Generated accessors for throwables
extension Card {

    @objc(addThrowablesObject:)
    @NSManaged public func addToThrowables(_ value: Player)

    @objc(removeThrowablesObject:)
    @NSManaged public func removeFromThrowables(_ value: Player)

    @objc(addThrowables:)
    @NSManaged public func addToThrowables(_ values: NSSet)

    @objc(removeThrowables:)
    @NSManaged public func removeFromThrowables(_ values: NSSet)

}

// MARK: Generated accessors for utilities
extension Card {

    @objc(addUtilitiesObject:)
    @NSManaged public func addToUtilities(_ value: Player)

    @objc(removeUtilitiesObject:)
    @NSManaged public func removeFromUtilities(_ value: Player)

    @objc(addUtilities:)
    @NSManaged public func addToUtilities(_ values: NSSet)

    @objc(removeUtilities:)
    @NSManaged public func removeFromUtilities(_ values: NSSet)

}

extension Card : Identifiable {

}
