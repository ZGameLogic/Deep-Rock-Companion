//
//  Deep_Rock_CompansionApp.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 10/13/22.
//

import SwiftUI

 @main
struct Deep_Rock_CompansionApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
