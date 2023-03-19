//
//  MonstersView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/5/23.
//

import SwiftUI

struct MonstersView: View {
    
    @State var searched = ""
    @State var pinned: [Monster] = []
    
    var body: some View {
        NavigationStack {
            List {
                if(!pinned.isEmpty){
                    Section("Pinned", content: {
                        ForEach(pinned.sorted(by: <)) { monster in
                            if(monster.name.contains(searched) || searched == ""){
                                NavigationLink {
                                    MonsterDetailView(monster: monster)
                                } label: {
                                    MonsterListView(monster: monster)
                                        .swipeActions(allowsFullSwipe: true, content: {
                                            Button("Unpin"){
                                                pinned.removeAll(where: {$0.id == monster.id})
                                            }.tint(.purple)
                                        })
                                }
                            }
                        }
                    })
                }
                ForEach(MonsterMap().monsters, id: \.id) { monster in
                    if(monster.name.contains(searched) || searched == ""){
                        NavigationLink {
                            MonsterDetailView(monster: monster)
                        } label: {
                            MonsterListView(monster: monster).swipeActions(allowsFullSwipe: true, content: {
                                Button("Pin"){
                                    pinned.append(monster)
                                }.tint(.purple)
                            })
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
