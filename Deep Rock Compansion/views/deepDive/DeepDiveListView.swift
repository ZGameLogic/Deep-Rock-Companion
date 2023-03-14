//
//  DeepDiveListView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/11/23.
//

import SwiftUI

struct DeepDiveListView: View {
    
    let deepDive : DeepDive
    
    var body: some View {
        VStack {
            HStack{
                Text(deepDive.name!).font(.title)
                Spacer()
            }
            HStack{
                ForEach(deepDive.playersArray){ player in
                    Text(player.playerName!)
                }
                Spacer()
            }
            HStack{
                Text(deepDive.lastSaved!.formatted(.dateTime.day().month().year()))
                Spacer()
            }
        }
    }
}

struct DeepDiveListView_Previews: PreviewProvider {
    static var previews: some View {
        DeepDiveListView(deepDive: DeepDive())
    }
}
