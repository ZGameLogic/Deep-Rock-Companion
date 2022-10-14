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
            VoiceLinesView().padding()
                .tabItem({
                    Label("Voice Lines", systemImage: "mic")
                }).tag(1)
            MusicTracksView().padding()
                .tabItem({
                    Label("Music Tracks", systemImage: "music.note.list")
                }).tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
