//
//  ContentView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MusicTracksView().padding()
                .tabItem({
                    Label("Music Tracks", systemImage: "music.note.list")
                }).tag(1)
//            MonstersView().padding()
//                .tabItem({
//                    Label("Monsterpedia", systemImage: "text.book.closed.fill")
//                }).tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
