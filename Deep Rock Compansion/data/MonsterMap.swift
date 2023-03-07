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
                    description: "The most common enemy type in the caves, especially during swarms. Grunt attacks are purely melee based. Grunts are small, so they don't block line of sight. Ranged attacks can fire over them to hit a target on the other side. Grunts are tougher on hazard 5 and will also deal 1 damage on a \"I\" result.",
                    image: "none",
                    health: 1,
                    range: 1,
                    movement: 3,
                    damageDie: ["regular"],
                    specials: [],
                    resistences: []),
            Monster(id: 1, name: "Web\nSpitter",
                    description: "The Web Spitter fires damaging and sticky web projectiles from afar. Those can web a Dwarf, immobilizing him on his next turn and leaving him wide open to attacks. Webbed Dwarves can carry out all actions on their next turn, except the movement action.",
                    image: "none",
                    health: 2,
                    range: 5,
                    movement: 3,
                    damageDie: ["regular", "regular"],
                    specials: ["webbed"],
                    resistences: []),
            Monster(id: 2, name: "Exploder",
                    description: "When an Exploder attacks while adjacent to a Dwarf or the sentry gun, it explodes instead, destroying itself and dealing explosive damage to creatures, Dwarves and the sentry gun on all adjacent spaces. Dwarves and the sentry gun ignore a 'scare result.\n\nKilling an Exploder will detonate it as well, applying the same destructive effect to all adjacent spaces.",
                    image: "none",
                    health: 1,
                    range: 1,
                    movement: 3,
                    damageDie: ["explosive"],
                    specials: [],
                    resistences: ["Explosive"]),
            Monster(id: 3, name: "Mactera\nSpawn",
                    description: "The Mactera can fly over obstacles (including stalagmites), but can't end its movement on them. This creature has a dangerous spit attack, with a stun ability that reduces the target's action points to 1 on their next turn.",
                    image: "none",
                    health: 2,
                    range: 3,
                    movement: 3,
                    damageDie: ["regular"],
                    specials: ["stunned"],
                    resistences: ["Meele", "Meele", "Fire"])
        ]
    }
}
