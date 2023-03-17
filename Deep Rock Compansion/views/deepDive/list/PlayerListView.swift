//
//  PlayerListView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/12/23.
//

import SwiftUI

struct PlayerListView: View {
    
    let player: Player
    
    var body: some View {
        VStack {
            HStack{
                Text(player.playerName!)
                Spacer()
            }
            HStack {
                Text(player.classType!).font(.subheadline)
                Spacer()
            }
        }
    }
}
