//
//  MonstersView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/5/23.
//

import SwiftUI

struct MonstersView: View {
    
    @State var searched = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(MonsterMap().monsters, id: \.name) { monster in
                    if(monster.name.contains(searched) || searched == ""){
                        NavigationLink {
                            MonsterDetailView(monster: monster)
                        } label: {
                            MonsterListView(monster: monster)
                        }
                    }
                }
            }.navigationTitle("Monsters")
        }.searchable(text: $searched)
    }
}

struct MonstersView_Previews: PreviewProvider {
    static var previews: some View {
        MonstersView()
    }
}
