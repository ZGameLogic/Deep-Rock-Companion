//
//  DeepDive+CoreDataProperties.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/12/23.
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
    @NSManaged public var mollyInv: Item?
    @NSManaged public var players: Player?

}
 
extension DeepDive : Identifiable {

}
