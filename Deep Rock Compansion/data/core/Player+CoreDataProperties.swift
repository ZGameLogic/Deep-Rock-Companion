//
//  Player+CoreDataProperties.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/13/23.
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
    @NSManaged public var primaryGun: String?
    @NSManaged public var secondaryAmmo: Int16
    @NSManaged public var secondaryGun: String?
    @NSManaged public var secondaryOverclocked: Bool
    @NSManaged public var primaryUpgrages: NSSet?
    @NSManaged public var rockInStones: NSSet?
    @NSManaged public var secondaryUpgrades: NSSet?
    @NSManaged public var throwables: NSSet?
    @NSManaged public var utilities: NSSet?
    @NSManaged public var deepDive: NSSet?
    
    public var primaryUpgradesArray: [String] {
        let set = primaryUpgrages as? Set<String> ?? []
        return set.sorted {
            if($0 == $1){
                return $0 < $1
            } else {
                return $0 < $1
            }
        }
    }

    public var secondaryUpgradesArray: [String] {
        let set = secondaryUpgrades as? Set<String> ?? []
        return set.sorted {
            if($0 == $1){
                return $0 < $1
            } else {
                return $0 < $1
            }
        }
    }
    
}

// MARK: Generated accessors for primaryUpgrages
extension Player {

    @objc(addPrimaryUpgragesObject:)
    @NSManaged public func addToPrimaryUpgrages(_ value: Card)

    @objc(removePrimaryUpgragesObject:)
    @NSManaged public func removeFromPrimaryUpgrages(_ value: Card)

    @objc(addPrimaryUpgrages:)
    @NSManaged public func addToPrimaryUpgrages(_ values: NSSet)

    @objc(removePrimaryUpgrages:)
    @NSManaged public func removeFromPrimaryUpgrages(_ values: NSSet)

}

// MARK: Generated accessors for rockInStones
extension Player {

    @objc(addRockInStonesObject:)
    @NSManaged public func addToRockInStones(_ value: Card)

    @objc(removeRockInStonesObject:)
    @NSManaged public func removeFromRockInStones(_ value: Card)

    @objc(addRockInStones:)
    @NSManaged public func addToRockInStones(_ values: NSSet)

    @objc(removeRockInStones:)
    @NSManaged public func removeFromRockInStones(_ values: NSSet)

}

// MARK: Generated accessors for secondaryUpgrades
extension Player {

    @objc(addSecondaryUpgradesObject:)
    @NSManaged public func addToSecondaryUpgrades(_ value: Card)

    @objc(removeSecondaryUpgradesObject:)
    @NSManaged public func removeFromSecondaryUpgrades(_ value: Card)

    @objc(addSecondaryUpgrades:)
    @NSManaged public func addToSecondaryUpgrades(_ values: NSSet)

    @objc(removeSecondaryUpgrades:)
    @NSManaged public func removeFromSecondaryUpgrades(_ values: NSSet)

}

// MARK: Generated accessors for throwables
extension Player {

    @objc(addThrowablesObject:)
    @NSManaged public func addToThrowables(_ value: Card)

    @objc(removeThrowablesObject:)
    @NSManaged public func removeFromThrowables(_ value: Card)

    @objc(addThrowables:)
    @NSManaged public func addToThrowables(_ values: NSSet)

    @objc(removeThrowables:)
    @NSManaged public func removeFromThrowables(_ values: NSSet)

}

// MARK: Generated accessors for utilities
extension Player {

    @objc(addUtilitiesObject:)
    @NSManaged public func addToUtilities(_ value: Card)

    @objc(removeUtilitiesObject:)
    @NSManaged public func removeFromUtilities(_ value: Card)

    @objc(addUtilities:)
    @NSManaged public func addToUtilities(_ values: NSSet)

    @objc(removeUtilities:)
    @NSManaged public func removeFromUtilities(_ values: NSSet)

}

// MARK: Generated accessors for deepDive
extension Player {

    @objc(addDeepDiveObject:)
    @NSManaged public func addToDeepDive(_ value: DeepDive)

    @objc(removeDeepDiveObject:)
    @NSManaged public func removeFromDeepDive(_ value: DeepDive)

    @objc(addDeepDive:)
    @NSManaged public func addToDeepDive(_ values: NSSet)

    @objc(removeDeepDive:)
    @NSManaged public func removeFromDeepDive(_ values: NSSet)

}

extension Player : Identifiable {

}
