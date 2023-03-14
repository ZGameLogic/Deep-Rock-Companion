//
//  Item+CoreDataProperties.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/13/23.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var amount: Int16
    @NSManaged public var name: String?
    @NSManaged public var mollyInv: NSSet?

}

// MARK: Generated accessors for mollyInv
extension Item {

    @objc(addMollyInvObject:)
    @NSManaged public func addToMollyInv(_ value: DeepDive)

    @objc(removeMollyInvObject:)
    @NSManaged public func removeFromMollyInv(_ value: DeepDive)

    @objc(addMollyInv:)
    @NSManaged public func addToMollyInv(_ values: NSSet)

    @objc(removeMollyInv:)
    @NSManaged public func removeFromMollyInv(_ values: NSSet)

}

extension Item : Identifiable {

}
