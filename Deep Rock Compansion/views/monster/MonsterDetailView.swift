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
        ScrollView {
            Image(monster.image).resizable().frame(width: 150, height: 150).scaledToFit()
            Text("\(monster.name)").font(.largeTitle)
            VStack {
                Text("Health: \(monster.health)")
                Text("Range: \(monster.range)")
                Text("Movement: \(monster.movement)")
            }.padding([.bottom], 10).padding([.top], 5)
            Divider()
            Section(header: Text("Resistances").font(.title2)) {
                HStack {
                    if(!monster.resistences.isEmpty){
                        ForEach (monster.resistences, id: \.self) {res in
                            resIconView(icon: res)
                        }
                    } else {
                        Text("None")
                    }
                }
            }
            Divider()
            if(!monster.damageDie.isEmpty){
                Section(header: Text("Damage").font(.title2)) {
                    HStack{
                        ForEach (monster.damageDie, id: \.self){ die in
                            Image(die).resizable().scaledToFit().frame(width: 40, height: 40)
                        }
                    }
                    HStack {
                        Image("Special").resizable().scaledToFit().frame(width: 40, height: 40)
                        Text("=").font(.title)
                        ForEach (monster.specials, id: \.self){ special in
                            Image(special).resizable().scaledToFit().frame(width: 40, height: 40)
                        }
                    }
                }
                Divider()
            }
            Text(monster.description).padding()
        }
    }
    
    func resIconView(icon: String) -> some View {
        var background = Color.white
        switch(icon){
        case "Bullet": background = Color.green
        case "Pierce": background = Color.blue
        case "Fire": background = Color.orange
        case "Explosive": background = Color.red
        case "Stunned": background = Color(red: 150/255.0, green: 150/255.0, blue: 150/255.0)
        default: background = Color(red: 209/255.0, green: 209/255.0, blue: 209/255.0)
        }
        return Group {
            Image(icon).resizable().scaledToFit().frame(width: 30, height: 30)
        }.frame(width: 34, height: 34).background(background).cornerRadius(5)
    }
}

struct MonsterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterDetailView(monster: MonsterMap().monsters[7])
    }
}
