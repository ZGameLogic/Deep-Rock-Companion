//
//  MusicTracksView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 10/14/22.
//

import SwiftUI
import AVKit

struct MusicTracksView: View {
    
    let songMap = SongMap()
    
    @State var audioPlayer: AVAudioPlayer!
    @State var selectedType = "game"
    @State var specialType = "swarm"
    @State var gameType = "pregame"
    @State var nowPlaying = ""
    @State var volume: Float = 1.0
    
    @State var playing = false
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    Group {
                        Text("Mission status")
                        Picker("Mission status type", selection: $selectedType) {
                            Text("Game").tag("game")
                            Text("Events").tag("events")
                        }.onChange(of: selectedType, perform: {newValue in
                            changeSong()
                        }).pickerStyle(.segmented)
                        Text("Select game state")
                        Picker("Game state", selection: $gameType) {
                            Text("Pre").tag("pregame")
                            Text("In").tag("ambiance")
                            Text("Extract").tag("extraction")
                            Text("Post").tag("postgame")
                            Text("Failed").tag("failed")
                        }.onChange(of: gameType, perform: {newValue in
                            changeSong()
                        }).pickerStyle(.segmented)
                            .disabled(selectedType != "game")
                        Text("Select event type")
                        Picker("Special type", selection: $specialType) {
                            Text("Swarm").tag("swarm")
                            Text("Oppressor").tag("oppressor")
                        }.onChange(of: specialType, perform: {newValue in
                            changeSong()
                        }).pickerStyle(.segmented)
                            .disabled(selectedType != "events")
                    }
                    Divider().overlay(.gray)
                    Group {
                        Text("Now playing").padding([.top], 20)
                        Text(nowPlaying).font(.headline)
                        
                        HStack {
                            Button(action: {
                                scroll(amount: -1)
                            }) {
                                Image(systemName: "backward.circle.fill").resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                            }
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
                            Button(action: {
                                scroll(amount: 1)
                            }) {
                                Image(systemName: "forward.circle.fill").resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }.padding(20)
                        Slider(
                            value: $volume,
                            in: 0...1.0,
                            label: {
                                Text("Volume")
                            }
                        ).onChange(of: volume, perform: { volume in
                            changeVolume()
                        })
                        Spacer()
                    }
                }
            }
            .onAppear {
                if(!playing){
                    changeSong()
                }
            }
        }.padding([.leading, .trailing], 20)
    }
    
    func changeVolume() {
        audioPlayer.setVolume(volume, fadeDuration: 0.0)
    }
    
    func scroll(amount: Int) {
        let selection = getSelectedType()
        let currentIndex = songMap.getIndex(songName: nowPlaying, songType: selection)
        let newSong = songMap.scroll(currentIndex: currentIndex, scrollAmount: amount, songType: selection)
        changeSong(song: newSong)
    }
    
    func play() {
        playing = true
        audioPlayer.play()
    }
    
    func pause() {
        playing = false
        audioPlayer.pause()
    }
    
    func getSelectedType() -> String{
        var selection = selectedType
        if(selectedType == "events"){
            selection = specialType
        } else {
            selection = gameType
        }
        return selection
    }
    
    func changeSong(song: Song) {
        let sound = Bundle.main.path(forResource: song.file, ofType: "mp3")
        if(playing){
            audioPlayer.stop()
        }
        print(song.file)
        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer.numberOfLoops = 100000
        nowPlaying = song.file
        if(playing){
            audioPlayer.play()
        }
    }
    
    func changeSong(){
        let selection = getSelectedType()
        let song = songMap.getSongByType(songType: selection)
        changeSong(song: song)
    }
}

struct MusicTracksView_Previews: PreviewProvider {
    static var previews: some View {
        MusicTracksView()
    }
}
