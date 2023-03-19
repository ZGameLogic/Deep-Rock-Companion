//
//  DeepDiveListView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/11/23.
//

import SwiftUI

struct DeepDiveListView: View {
    
    @Binding var deepDive : DeepDive
    
    var body: some View {
        VStack {
            HStack{
                Text(deepDive.name).font(.title)
                Spacer()
            }
            HStack{
                ForEach(deepDive.playersArray){
                    Text($0.playerBinding.playerName.wrappedValue!)
                }
                Spacer()
            }
            HStack{
                Text(deepDive.lastSaved.formatted(.dateTime.day().month().year()))
                Spacer()
            }
        }
    }
}
