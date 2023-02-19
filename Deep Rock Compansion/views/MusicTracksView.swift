//
//  MusicTracksView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 10/14/22.
//

import SwiftUI
import AVKit

struct MusicTracksView: View {
    
    @State var audioPlayer: AVAudioPlayer!
    @State var selectedType: String
    @State var specialType: String
    
    @State var playing = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Mission status")
                Picker("Mission status type", selection: $selectedType) {
                    Text("Pre-game").tag("pregame")
                    Text("Ambiance").tag("ambiance")
                    Text("Extraction").tag("extraction")
                    Text("Events").tag("events")
                }.onChange(of: selectedType, perform: {newValue in
                    changeSong()
                }).pickerStyle(.segmented)
                Text("Select event type")
                Picker("Special type", selection: $specialType) {
                    Text("Swarm").tag("swarm")
                    Text("Opressor").tag("oppressor")
                }.onChange(of: specialType, perform: {newValue in
                    changeSong()
                }).pickerStyle(.segmented)
                    .disabled(selectedType != "events")
                Spacer()
                HStack {
                    if(!playing){
                        Button(action: {
                            play()
                        }) {
                            Image(systemName: "play.circle.fill").resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                        }
                    } else {
                        Button(action: {
                            pause()
                        }) {
                            Image(systemName: "pause.circle.fill").resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "01 Into The Abyss", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
    
    func play() {
        playing = true
        audioPlayer.play()
    }
    
    func pause() {
        playing = false
        audioPlayer.pause()
    }
    
    func changeSong(){
        var selection = selectedType
        if(selectedType == "events"){
            selection += ".\(specialType)"
        }
        print(selection)
    }
}

struct MusicTracksView_Previews: PreviewProvider {
    static var previews: some View {
        MusicTracksView( selectedType: "pregame", specialType: "swarm")
    }
}
