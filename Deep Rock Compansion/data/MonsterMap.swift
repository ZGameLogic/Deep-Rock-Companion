//
//  MonsterMap.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/5/23.
//

import Foundation


struct MonsterMap {
    
    var monsters: [Monster]
    
    init(){
        monsters = [
            Monster(id: 0, name: "Grunt",
                    description: "This is a grunt oof",
                    image: "none",
                    health: 1,
                    range: 1,
                    movement: 3,
                    damageDie: 1,
                    special: "none",
                    resistences: ["Example": 1, "Example 2": 2]),
            Monster(id: 1, name: "Spitter",
                    description: "This is a spitter oof",
                    image: "none",
                    health: 2,
                    range: 5,
                    movement: 3,
                    damageDie: 2,
                    special: "Webbed",
                    resistences: ["Example": 1, "Example 2": 2])
        ]
    }
}
