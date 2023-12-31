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
            Monster(id: 0,
                    name: "Grunt",
                    description: "The most common enemy type in the caves, especially during swarms. Grunt attacks are purely melee based. Grunts are small, so they don't block line of sight. Ranged attacks can fire over them to hit a target on the other side. Grunts are tougher on hazard 5 and will also deal 1 damage on a \"I\" result.",
                    image: "Grunt",
                    health: 1,
                    range: 1,
                    movement: 3,
                    damageDie: ["HitDie"],
                    specials: [],
                    resistences: [],
                   rockInStone: false),
            Monster(id: 1,
                    name: "Web Spitter",
                    description: "The Web Spitter fires damaging and sticky web projectiles from afar. Those can web a Dwarf, immobilizing him on his next turn and leaving him wide open to attacks. Webbed Dwarves can carry out all actions on their next turn, except the movement action.",
                    image: "WebSpitter",
                    health: 2,
                    range: 5,
                    movement: 3,
                    damageDie: ["HitDie", "HitDie"],
                    specials: ["Webbed"],
                    resistences: [],
                    rockInStone: false),
            Monster(id: 2,
                    name: "Exploder",
                    description: "When an Exploder attacks while adjacent to a Dwarf or the sentry gun, it explodes instead, destroying itself and dealing explosive damage to creatures, Dwarves and the sentry gun on all adjacent spaces. Dwarves and the sentry gun ignore a 'scare result.\n\nKilling an Exploder will detonate it as well, applying the same destructive effect to all adjacent spaces.",
                    image: "Exploder",
                    health: 1,
                    range: 1,
                    movement: 3,
                    damageDie: ["EHitDie"],
                    specials: [],
                    resistences: ["Explosive"],
                    rockInStone: false),
            Monster(id: 3,
                    name: "Mactera Spawn",
                    description: "The Mactera can fly over obstacles (including stalagmites), but can't end its movement on them. This creature has a dangerous spit attack, with a stun ability that reduces the target's action points to 1 on their next turn.",
                    image: "MacteraSpawn",
                    health: 2,
                    range: 3,
                    movement: 3,
                    damageDie: ["HitDie"],
                    specials: ["Stunned"],
                    resistences: ["Axe", "Axe", "Fire"],
                    rockInStone: false),
            Monster(id: 4,
                    name: "Slasher",
                    description: "The Glyphid Slasher is covered in sharp white growths, for increased protection. It has a nasty habit of burrowing out of the ground before attacking. Slashers can knock over a Dwarf with a crippling slash attack.",
                    image: "Slasher",
                    health: 2,
                    range: 1,
                    movement: 3,
                    damageDie: ["HitDie", "HitDie"],
                    specials: ["Knocked"],
                    resistences: ["Axe", "Bullet", "Fire"],
                    rockInStone: false),
            Monster(id: 5,
                    name: "Brood Nexus",
                    description: "The immobile Brood Nexus deals no damage, which means its bite results are ignored. However, it has the ability to spawn Glyphid Grunts. When the Brood Nexus activates, roll 2 dice. For each [I rolled, place 1 Grunt next to the Brood Nexus, on the adjacent empty space(s) nearest to a Dwarf.\nWhen the Brood Nexus dies, activate it one last time, by rolling 2 dice to check whether any Grunts appear from its corpse.",
                    image: "BroodNexus",
                    health: 5,
                    range: 0,
                    movement: 0,
                    damageDie: ["HitDie", "HitDie"],
                    specials: ["Spawn"],
                    resistences: ["Bullet", "Stunned"],
                    rockInStone: false),
            Monster(id: 6,
                    name: "Spitball Infector",
                    description: "The 'Spitballer' is a tough, plant-like enemy. It's immobile, since it's rooted to the floor. It fires acidic mortar globs, by swelling up and spewing them at the nearest Dwarf, possibly knocking him over.",
                    image: "SpitballInfector",
                    health: 5,
                    range: 7,
                    movement: 0,
                    damageDie: ["HitDie"],
                    specials: ["Knocked"],
                    resistences: ["Explosive", "Axe", "Bullet", "Stunned"],
                    rockInStone: true),
            Monster(id: 7,
                    name: "Praetorian",
                    description: "The imposing Praetorian is well protected, but its abdomen sticks out at the rear, with no plating to protect it. Attacking it from behind (refer to the green spaces in the diagram) allows you to ignore its resistance.\nWhen the Praetorian moves, it always faces the direction it moves in (towards the nearest Dwarf).",
                    image: "Praetorian",
                    health: 6,
                    range: 2,
                    movement: 3,
                    damageDie: ["HitDie"],
                    specials: ["Damage", "Damage"],
                    resistences: ["Axe", "Fire", "Fire", "Bullet"],
                    rockInStone: true),
            Monster(id: 8,
                    name: "Oppressor",
                    description: "The monstrous Oppressor takes up two spaces on the board. When moving the Oppressor, count its movement from its front part and always turn it so it faces the direction it moves in. As it moves, it will follow the shortest straight path to its target, and will crash through and destroy stalagmites, Grunts and cave walls. Any minerals contained within the walls drop to the floor. If the Oppressor ends its movement next to its target, it performs a free attack. (Note: the 'Fast Critters' event card does not grant the Oppressor two attacks.) The Oppressor is equipped with thick front armor, but attacking it from behind (refer to the green spaces in the diagram) allows you to ignore its resistance. The Oppressor does not suffer double damage if an area effect weapon hits both of its spaces.",
                    image: "Oppressor",
                    health: 7,
                    range: 1,
                    movement: 3,
                    damageDie: ["HitDie"],
                    specials: ["Knocked", "Damage"],
                    resistences: ["Bullet", "Bullet", "Pierce", "Axe", "Fire", "Stunned"],
                    rockInStone: true),
            Monster(id: 9,
                    name: "Warden",
                    description: "When the Glyphid Warden activates, it moves towards the nearest creature. If after its movement, the Warden is more than 3 spaces away from the nearest creature, place 1 Grunt next to the Warden, on the adjacent empty space nearest to a Dwarf.\nThe Warden has no attack, but generates a protective shield around creatures within 3 spaces of its location. The shield cancels 2 damage per attack. When the Warden is killed during an attack, its protective shield disintegrates, and the creatures it was protecting immediately lose the associated protection bonus.",
                    image: "placeholder",
                    health: 2,
                    range: 3,
                    movement: 3,
                    damageDie: [],
                    specials: [],
                    resistences: ["Fire", "Explosive"],
                    rockInStone: false),
            Monster(id: 10,
                    name: "Goo Bomber",
                    description: "The Goo Bomber will fly towards the nearest Dwarf. When it attacks, it not only hurts its target, but also surrounds it with sticky goo: Regardless of the dice result, place goo tokens on all vacant spaces (not tunnel exits or pits) surrounding the target. Take the goo tokens from elsewhere if you did not have enough to place. Any non-flying creature or Dwarf walking onto a tile with goo must remove the goo it stepped on, and then end the move action immediately.",
                    image: "placeholder",
                    health: 2,
                    range: 3,
                    movement: 3,
                    damageDie: ["HitDie"],
                    specials: ["Stunned"],
                    resistences: ["Axe", "Axe"],
                    rockInStone: false),
            Monster(id: 11,
                    name: "Menace",
                    description: "The Glyphid Menace will attack with a dangerous acid spit. When the Glyphid Menace takes any damage (losing health) from an attack, it hides for a short while, meaning it cannot be attacked again by any means in that Dwarf's turn. It will resurface at the end of that Dwarf's turn. If it is stunned or frozen, it will NOT hide in the same turn.",
                    image: "placeholder",
                    health: 3,
                    range: 6,
                    movement: 3,
                    damageDie: ["HitDie"],
                    specials: ["Damage"],
                    resistences: ["Bullet"],
                    rockInStone: false)
        ]
    }
}
