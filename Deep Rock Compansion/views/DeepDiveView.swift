//
//  DeepDiveView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/11/23.
//

import SwiftUI

struct DeepDiveView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DeepDive.name, ascending: true), NSSortDescriptor(keyPath: \DeepDive.name, ascending: true)],
        animation: .default)
    private var deepDives: FetchedResults<DeepDive>
    
    @State var searched = ""
    @State var showAddDD = false
    @State var showRules = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(deepDives) { dive in
                    if(searched == "" || dive.name.contains(searched)){
                        NavigationLink(destination: {
                            DeepDiveDetailView(deepDive: dive.deepDiveBinding, players: dive.playersBinding)
                        }, label: {DeepDiveListView(deepDive: dive.deepDiveBinding)})
                    }
                }.onDelete(perform: deleteDive)
            }.navigationTitle("Deep Dives")
                .toolbar {
                ToolbarItem {
                    Button(action: {
                        showAddDD = true
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                ToolbarItem {
                    Button(action: {showRules = true}, label: {
                        Label("Rules", systemImage: "text.book.closed")
                    })
                }
            }
        }.searchable(text: $searched)
            .sheet(isPresented: $showAddDD, content: {
                DeepDiveAddView(presented: $showAddDD)
                Text("")
            }).sheet(isPresented: $showRules, content: {
                DeepDiveRulesView()
            })
    }
    
    private func deleteDive(offsets: IndexSet){
        withAnimation {
            offsets.map { deepDives[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct DeepDiveView_Previews: PreviewProvider {
    static var previews: some View {
        DeepDiveView()
    }
}


