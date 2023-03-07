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
            HStack{
                VStack {
                    // TODO add image
                    Text(monster.name).font(.headline)
                }
            }
            HStack {
                VStack{
                    Text("H: \(monster.health)")
                    Text("R: \(monster.range)")
                    Text("M: \(monster.movement)")
                    HStack {
                        ForEach (monster.damageDie, id: \.self){ die in
                            Text(die)
                        }
                    }
                }
            }
            VStack {
                Text("!")
                ForEach (monster.specials, id: \.self){ special in
                    Text(special)
                }
            }
            Spacer()
        }
    }
}

struct MonsterListView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterListView(monster: Monster(id: 1, name: "Grunt", description: "Oh lord a grunt", image: "", health: 1, range: 1, movement: 3, damageDie: ["regular"], specials: ["Webbed", "Second"], resistences: ["Bullet"]))
    }
}
