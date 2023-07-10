//
//  DeepRockAVPlayer.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 7/10/23.
//

import Foundation
import AVFoundation

class DeepRockAVPlayer: ObservableObject {
    
    let songMap = SongMap()
    let audioPlayer: AVPlayer!
    
    @Published var nowPlaying = ""
    var type = ""
    
    init() {
        self.audioPlayer = AVPlayer()
        NotificationCenter.default
            .addObserver(self,
            selector: #selector(playerDidFinishPlaying),
            name: .AVPlayerItemDidPlayToEndTime,
            object: audioPlayer.currentItem
        )
    }
    
    func setVolume(volume: Float){
        audioPlayer.volume = volume
    }
    
    func play(){
        audioPlayer.play()
    }
    
    func pause(){
        audioPlayer.pause()
    }
    
    func changeSong(song: Song) {
        let sound = Bundle.main.url(forResource: song.file, withExtension: "mp3")
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: [.mixWithOthers, .allowAirPlay])
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
        audioPlayer.replaceCurrentItem(with: AVPlayerItem(url: sound!))
        nowPlaying = song.file
        print(nowPlaying)
    }
    
    func scroll(amount: Int) {
        let selection = type
        let currentIndex = songMap.getIndex(songName: nowPlaying, songType: selection)
        let newSong = songMap.scroll(currentIndex: currentIndex, scrollAmount: amount, songType: selection)
        changeSong(song: newSong)
    }
    
    @objc func playerDidFinishPlaying() {
        print("Player Finished")
        scroll(amount: 1)
        play()
        print("New song: \(nowPlaying)")
    }
}
