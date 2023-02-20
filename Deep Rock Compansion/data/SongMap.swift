//
//  SongMap.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 2/20/23.
//

import Foundation


struct SongMap {
    
    var songs: [Song]
    
    init(){
        songs = [
            Song(file: "Into the Abyss", type: "ambience", start: [0, 48, 0], end: [4, 55, 11]),
            Song(file: "Attack of the Glyphids", type: "events.swarm", start: [0, 23, 6], end: [1, 44, 16]),
            Song(file: "The Deep Dive", type: "pregame", start: [0, 14, 0], end: [2, 7, 8]),
            Song(file: "Hold my Beard", type: "events.swarm", start: [0, 27, 7], end: [1, 54, 13]),
            Song(file: "Theyre Here", type: "events.swarm", start: [0, 26, 8], end: [1, 59, 14]),
            Song(file: "Cowards Crossing", type: "ambience", start: [0, 50, 19], end: [7, 5, 4]),
            Song(file: "Petrified Fury", type: "events.swarm", start: [0, 17, 11], end: [2, 45, 20]),
            Song(file: "The Descent", type: "ambience", start: [0, 0, 0], end: [0, 5, 36]),
            Song(file: "Robot Getaway", type: "extraction", start: [0, 34, 16], end: [2, 26, 16]),
            Song(file: "Horrors of Hoxxes", type: "events.oppressor", start: [0, 38, 10], end: [2, 57, 13]),
            Song(file: "Principle of Darkness", type: "pregame", start: [0, 34, 22], end: [4, 13, 02]),
            Song(file: "Principle of Darkness", type: "ambience", start: [0, 34, 22], end: [4, 13, 02]),
            Song(file: "The Shadows are Moving", type: "events.swarm", start: [0, 25, 10], end: [1, 45, 21]),
            Song(file: "The Shadows are Moving", type: "extraction", start: [0, 25, 10], end: [1, 45, 21]),
            Song(file: "I am Lost", type: "ambiance", start: [0, 29, 18], end: [5, 17, 7]),
            Song(file: "Fighting the Shadows", type: "events.oppressor", start: [0, 42, 13], end: [2, 29, 11]),
            Song(file: "Fathomless Tomb", type: "ambience", start: [1, 4, 0], end: [7, 44, 0]),
            Song(file: "Leave No Dwarf Behind", type: "extraction", start: [0, 32, 6], end: [1, 32, 6]),
            Song(file: "March of the Brave", type: "extraction", start: [0, 35, 9], end: [3, 57, 11]),
            Song(file: "Beneath the Crust", type: "postgame", start: [0, 0, 0], end: [2, 18, 0]),
            Song(file: "Karls End", type: "ambiance", start: [0, 22, 8], end: [3, 4, 0]),
            Song(file: "A Matter of Skill and Ammunition", type: "ambience", start: [0, 46, 0], end: [4, 22, 0]),
            Song(file: "The Only Way Out is Through", type: "ambience", start: [0, 39, 14], end: [5, 5, 23]),
            Song(file: "Ode to the Fallen", type: "failed", start: [0, 0, 0], end: [5, 30, 0])
        ]
    }
    
    func getSong(songType: String) -> Song {
        var valid:[Song] = []
        for song in songs {
            if(song.type == songType) {valid.append(song)}
        }
        return valid.randomElement()!
    }
    
    struct Song {
        var file: String
        var startMili: Int
        var endMili: Int
        var type: String
        
        init(file: String, type: String, start: [Int], end: [Int]){
            self.file = file
            self.type = type
            self.startMili = (start[0] * 60 * 1000) + (start[1] * 1000) + start[2]
            self.endMili = (end[0] * 60 * 1000) + (end[1] * 1000) + end[2]
        }
    }
}
