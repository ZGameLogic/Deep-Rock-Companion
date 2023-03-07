//
//  MonsterDetailView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/5/23.
//

import SwiftUI

struct MonsterDetailView: View {
    let monster: Monster
    var body: some View {
        Text("\(monster.name)")
    }
}

struct MonsterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterDetailView(monster: Monster(id: 1, name: "Grunt", description: "Oh lord a grunt", image: "", health: 1, range: 1, movement: 3, damageDie: ["regular"], specials: [], resistences: [""]))
    }
}
