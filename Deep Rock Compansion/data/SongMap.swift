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
            Song(file: "Into the Abyss", type: "ambience"),
            Song(file: "Attack of the Glyphids", type: "swarm"),
            Song(file: "The Deep Dive", type: "pregame"),
            Song(file: "Hold my Beard", type: "swarm"),
            Song(file: "Theyre Here", type: "swarm"),
            Song(file: "Cowards Crossing", type: "ambience"),
            Song(file: "Petrified Fury", type: "swarm"),
            Song(file: "The Descent", type: "ambience"),
            Song(file: "Robot Getaway", type: "extraction"),
            Song(file: "Horrors of Hoxxes", type: "oppressor"),
            Song(file: "Principle of Darkness", type: "pregame"),
            Song(file: "Principle of Darkness", type: "ambience"),
            Song(file: "The Shadows are Moving", type: "swarm"),
            Song(file: "The Shadows are Moving", type: "extraction"),
            Song(file: "I am Lost", type: "ambiance"),
            Song(file: "Fighting the Shadows", type: "oppressor"),
            Song(file: "Fathomless Tomb", type: "ambience"),
            Song(file: "Leave No Dwarf Behind", type: "extraction"),
            Song(file: "March of the Brave", type: "extraction"),
            Song(file: "Beneath the Crust", type: "postgame"),
            Song(file: "Karls End", type: "ambiance"),
            Song(file: "A Matter of Skill and Ammunition", type: "ambience"),
            Song(file: "The Only Way Out is Through", type: "ambience"),
            Song(file: "Ode to the Fallen", type: "failed")
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
        var type: String
        
        init(file: String, type: String){
            self.file = file
            self.type = type
        }
    }
}
