//
//  DeepDiveDetailView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/16/23.
//

import SwiftUI

struct DeepDiveDetailView: View {
    
    @Environment(\.editMode) private var editMode
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var deepDive: DeepDive
    
    @State var presentAddPlayer = false
    
    @Binding var players: [Player]
    @State var player: Player? = nil
    
    var body: some View {
        Form {
            Section("General", content: {
                if(editMode!.wrappedValue.isEditing){
                    TextField("Title", text: $deepDive.name)
                    DatePicker("Date", selection: $deepDive.lastSaved, displayedComponents: [.date])
                    Stepper(value: $deepDive.gold, in: 0...999) {
                        HStack {
                            Text("Molly Gold:")
                            Text("\(deepDive.gold)").bold()
                        }
                    }
                    Stepper(value: $deepDive.nitra, in: 0...999) {
                        HStack {
                            Text("Molly Nitra:")
                            Text("\(deepDive.nitra)").bold()
                        }
                    }
                } else {
                    Text(deepDive.name)
                    Text(deepDive.lastSaved.formatted(.dateTime.day().month().year()))
                    HStack {
                        Text("Gold: \(deepDive.gold)")
                        Spacer()
                        Divider()
                        Spacer()
                        Text("Nitra: \(deepDive.nitra)")
                    }
                }
            })
            
            Section("Players", content: {
                if(editMode!.wrappedValue.isEditing){
                    Button("Add player", action: {
                        player = nil
                        presentAddPlayer = true
                    })
                    List {
                        ForEach(deepDive.playersArray){ player in
                            PlayerListView(player: player)
                                .onTapGesture {
                                    self.player = player
                                    presentAddPlayer = true
                                }
                        }.onDelete(perform: deletePlayer)
                    }
                } else {
                    ForEach (deepDive.playersArray) {player in
                        PlayerListDetailView(player: player)
                    }
                }
            })
            
            Section("Notes", content: {
                if(editMode!.wrappedValue.isEditing){
                    TextEditor(text: $deepDive.notes)
                } else {
                    Text(deepDive.notes)
                }
            })
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("\(deepDive.name)")
        .animation(nil, value: editMode?.wrappedValue)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }.onChange(of: editMode!.wrappedValue.isEditing, perform: {newVal in
            if(!newVal){
                do {
                    try viewContext.save()
                } catch {
                    print(error)
                }
            }
        }).onChange(of: players, perform: {newVal in
            deepDive.setPlayers(players: newVal)
        })
        .sheet(isPresented: $presentAddPlayer, content: {
            PlayerView(players: $players, presenting: $presentAddPlayer, player: player)
        })
    }
    
    private func deletePlayer(offsets: IndexSet){
        withAnimation {
            offsets.map { $0 }.forEach{value in
                players.remove(at: value)
            }
        }
    }
}
