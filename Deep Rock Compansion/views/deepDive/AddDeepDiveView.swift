//
//  AddDeepDiveView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/11/23.
//

import SwiftUI

struct AddDeepDiveView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @State var deepDiveName = ""
    @State var date = Date.now
    @State var mollyGold = 0;
    @State var mollyNitra = 0
    @State var notes = ""
    
    @State var errorMessage = ""
    @State var showError = false
    
    @State var presentAddPlayer = false
    
    @Binding var presented: Bool
    
    @State var players: [Player] = []
    
    var body: some View {
        Text("Add Deep Dive").font(.title).padding()
        Form {
            Section("General", content: {
                TextField("Deep Dive Title", text: $deepDiveName)
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
                    presentAddPlayer = true
                })
                List {
                    ForEach(players){ player in
                        PlayerListView(player: player)
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
        }.sheet(isPresented: $presentAddPlayer, content: {
            AddPlayerView(players: $players, presenting: $presentAddPlayer)
        }).alert("Unable to add deep dive",
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
        if(deepDiveName.isEmpty){
            valid = false
            errors += "\nNo title was given"
        }
        if(players.isEmpty){
            valid = false
            errors += "\nNo players have been added"
        }
        // TODO check players
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
        deepDive.name = deepDiveName
        deepDive.lastSaved = Date.now
        for player in players {deepDive.addToPlayers(player)}
        let nitra = Item(context: viewContext)
        nitra.name = "nitra"
        nitra.amount = Int16(mollyNitra)
        let gold = Item(context: viewContext)
        gold.name = "gold"
        gold.amount = Int16(mollyGold)
        deepDive.addToMollyInv(nitra)
        deepDive.addToMollyInv(gold)
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
        presented = false
    }
}

struct AddDeepDiveView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeepDiveView(presented: .constant(true))
    }
}
