//
//  MonsterListView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/5/23.
//

import SwiftUI

struct MonsterListView: View {
    
    let monster: Monster
    
    var body: some View {
        HStack {
            // TODO add image
            VStack {
                HStack{
                    Text(monster.name).font(.headline)
                    Spacer()
                }
                HStack {
                    Text("H: \(monster.health)")
                    Text("R: \(monster.range)")
                    Text("M: \(monster.movement)")
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct MonsterListView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterListView(monster: Monster(id: 1, name: "Grunt", description: "Oh lord a grunt", image: "", health: 1, range: 1, movement: 3, damageDie: 1, special: "", resistences: ["": 1]))
    }
}
