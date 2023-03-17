//
//  Weapon.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/13/23.
//

import Foundation

struct Data {
    let classes: [String: [String]] = [
        "Gunner": ["Massive Minigun", "Thunderhead Heavy AC"],
        "Engineer": ["Grenade Launcher", "Breach Cutter"],
        "Scout": ["M-1000", "Deepcore GK2 AR"],
        "Driller": ["Flamethrower", "Cryo Cannon"]
    ]
    
    let secondaryWeapon: [String] = [
        "Brt7 Burst Fire Gun",
        "Bulldog Heavy Revolver",
        "Experimental Plasma Charger",
        "Experimental Plasma Igniter",
        "Jury-Rigged Boomstick",
        "Stubby Boltaic Smg",
        "Subata 120 Semi-Automatic",
        "'Warthog' Auto 210 Shotgun",
        "Zhukov Nuk17 Twin Smgs"
    ]
    
    let upgrades: [String] = [
        "none",
        "doubleDie",
        "ignoreResistances",
        "rangePlusOne",
        "rerollDie",
        "hitStunned",
        "bonusExplosive",
        "bonusFire",
        "bonusPierce",
        "bonusBullet",
        "allAmmo"
    ]
    
    let rockInStones: [String] = [
        ""
    ]
    
    let grenades: [String] = [
        "None",
        "Incendiary/Frag Grenade",
        "Plasma Grenade",
        "Impact Axe",
        "Inhibitor Field Generator",
        "L.U.R.E. Grenade",
        "Proximity Grenade",
        "Sticky Grenade",
        "Satchel Charge",
        "Tunnel Carver",
        "Corrosive Bomb",
        "Cluster Grenade",
        "Electrocution Grenade",
        "Soil Smasher"
    ]
    
    func upgradeScroll(current: String, amount: Int) -> String {
        let currentIndex = upgrades.firstIndex(of: current)!
        var newIndex = currentIndex + amount
        if(newIndex < 0) {newIndex += upgrades.count}
        if(newIndex >= upgrades.count) {newIndex -= upgrades.count}
        return upgrades[newIndex]
    }
}
