//
//  AddDeepDiveView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/11/23.
//

import SwiftUI

struct DeepDiveAddView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var presented: Bool
    
    @State var errorMessage = ""
    @State var showError = false
    
    @State var mollyGold = 0
    @State var mollyNitra = 0
    @State var notes = ""
    
    @State var presentAddPlayer = false
    
    @State var title = ""
    @State var date = Date.now
    
    @State var players: [Player] = []
    @State var player: Player? = nil
    
    var body: some View {
        Text("Add Deep Dive").font(.title).padding()
        Form {
            Section("General", content: {
                TextField("Deep Dive Title", text: $title)
                DatePicker("Date", selection: $date, displayedComponents: [.date])
                Stepper(value: $mollyGold, in: 0...999) {
                    HStack {
                        Text("Molly Gold:")
                        Text("\(mollyGold)").bold()
                    }
                }
                Stepper(value: $mollyNitra, in: 0...999) {
                    HStack {
                        Text("Molly Nitra:")
                        Text("\(mollyNitra)").bold()
                    }
                }
            })
            Section("Players", content: {
                Button("Add player", action: {
                    player = nil
                    presentAddPlayer = true
                })
                List {
                    ForEach(players){ player in
                        PlayerListView(player: player)
                            .onTapGesture {
                                self.player = player
                                presentAddPlayer = true
                            }
                    }.onDelete(perform: deletePlayer)
                }
            })
            Section("Notes", content: {
                TextEditor(text: $notes)
            })
            Button(action: validateDeepDive, label: {
                HStack{
                    Spacer()
                    Text("Create Deep Dive")
                    Spacer()
                }
            })
        }
        .sheet(isPresented: $presentAddPlayer, content: {
            PlayerView(players: $players, presenting: $presentAddPlayer, player: player)
        })
        .alert("Unable to add deep dive",
                 isPresented: $showError,
                 actions: {
                 Button("Okay", action: {})
             }, message: {
                 Text("\(errorMessage)")
             })
    }
    
    private func validateDeepDive(){
        var valid = true
        var errors = ""
        if(title.isEmpty){
            valid = false
            errors += "\nNo title was given"
        }
        if(players.isEmpty){
            valid = false
            errors += "\nNo players have been added"
        }
        if(valid){
            addDeepDive()
        } else {
            errorMessage = errors
            showError = true
        }
    }
    
    private func deletePlayer(offsets: IndexSet){
        withAnimation {
            offsets.map { $0 }.forEach{value in
                players.remove(at: value)
            }
        }
    }
    
    private func addDeepDive(){
        let deepDive = DeepDive(context: viewContext)
        deepDive.name = title
        deepDive.lastSaved = Date.now
        for player in players {deepDive.addToPlayers(player)}
        deepDive.nitra = Int16(mollyNitra)
        deepDive.gold = Int16(mollyGold)
        deepDive.notes = notes
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
        presented = false
    }
}
