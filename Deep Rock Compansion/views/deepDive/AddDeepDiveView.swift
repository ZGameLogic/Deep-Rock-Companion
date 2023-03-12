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
    
    var players: [Player] = []
    
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
                ForEach(players){ player in
                    PlayerListView()
                }
                Button("Add player", action: {
                    presentAddPlayer = true
                })
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
            AddPlayerView(players: players)
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
    
    private func addDeepDive(){
        let deepDive = DeepDive(context: viewContext)
        deepDive.name = "This is a new deep dive"
        deepDive.lastSaved = Date.now
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
