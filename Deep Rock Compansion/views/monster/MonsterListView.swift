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
                    Image("placeholder").scaledToFit()
                    Text(monster.name).font(.headline).frame(width: 85, height: 50)
                }
                VStack{
                    if(monster.resistences.count < 4){
                        HStack{
                            ForEach (monster.resistences, id: \.self) { resistance in
                                resIconView(icon: resistance)
                            }
                        }.frame(width: 50)
                    } else {
                        HStack{
                            ForEach (monster.resistences[0...2], id: \.self) { resistance in
                                resIconView(icon: resistance)
                            }
                        }.frame(width: 50)
                        HStack{
                            ForEach (monster.resistences[3...monster.resistences.count - 1], id: \.self) { resistance in
                                resIconView(icon: resistance)
                            }
                        }.frame(width: 50)
                    }
                    if(!monster.resistences.isEmpty){
                        Divider().overlay(.gray)
                    }
                    Text("H: \(monster.health)")
                    Text("R: \(monster.range)")
                    Text("M: \(monster.movement)")
                    if(!monster.damageDie.isEmpty){
                        Divider().overlay(.gray)
                    }
                    HStack {
                        ForEach (monster.damageDie, id: \.self){ die in
                            Image(die).resizable().scaledToFit().frame(width: 40, height: 40)
                        }
                    }
                }.frame(width: 100)
            }
            VStack {
                if(!monster.specials.isEmpty){
                    Section(header: Image("Special").resizable().scaledToFit().frame(width: 40, height: 40)){
                        ForEach (monster.specials, id: \.self){ special in
                            Image(special).resizable().scaledToFit().frame(width: 40, height: 40)
                        }
                    }
                }
            }.background(Color.white).cornerRadius(12)
            Spacer()
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
            Image(icon).resizable().scaledToFit().frame(width: 20, height: 20)
        }.frame(width: 24, height: 24).background(background).cornerRadius(5)
    }
}

struct MonsterListView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterListView(monster: MonsterMap().monsters[8])
    }
}
