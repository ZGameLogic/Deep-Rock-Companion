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
                    if(searched == "" || dive.name!.contains(searched)){
                        NavigationLink {
                            Text("Greet")
                        } label: {
                            DeepDiveListView(deepDive: dive)
                        }
                    }
                }.onDelete(perform: deleteDive)
            }.navigationTitle("Deep Dives").toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
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
            AddDeepDiveView(presented: $showAddDD)
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
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
