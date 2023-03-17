//
//  PlayerListDetailView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/17/23.
//

import SwiftUI

struct PlayerListDetailView: View {
    
    let ICON_SIZE: CGFloat = 25
    
    let player: Player
    
    var body: some View {
        VStack {
            HStack {
                VStack{ // far left player stuff
                    HStack {
                        Text(player.playerName!).font(.headline)
                        Spacer()
                    }
                    HStack {
                        Text(player.classType!).font(.subheadline)
                        Spacer()
                    }
                }.frame(width: 70)
                Divider()
                VStack {
                    Text("HP")
                    Text("\(player.health)")
                }
                Divider().padding([.trailing])
                VStack {
                    HStack{ // primary
                        VStack {
                            HStack {
                                Text(player.primaryGun!)
                                Spacer()
                            }
                            HStack {
                                Text("Ammo: \(player.primaryAmmo)")
                                Spacer()
                            }
                        }
                        Spacer()
                        VStack {
                            Image(player.primaryUpgradesArray[0].name!).resizable().scaledToFit().frame(width: ICON_SIZE, height: ICON_SIZE)
                            Image(player.primaryUpgradesArray[1].name!).resizable().scaledToFit().frame(width: ICON_SIZE, height: ICON_SIZE)
                        }.background(Color.gray).cornerRadius(5)
                    }
                    Divider()
                    HStack { // secondary
                        VStack {
                            HStack{
                                Text(player.secondaryGun!)
                                Spacer()
                            }
                            HStack {
                                Text("Ammo: \(player.secondaryAmmo)")
                                Spacer()
                            }
                            HStack {
                                Text("OC: \(player.secondaryOverclocked ? "true" : "false")")
                                Spacer()
                            }
                        }
                        Spacer()
                        VStack {
                            Image(player.secondaryUpgradesArray[0].name!).resizable().scaledToFit().frame(width: ICON_SIZE, height: ICON_SIZE)
                            Image(player.secondaryUpgradesArray[1].name!).resizable().scaledToFit().frame(width: ICON_SIZE, height: ICON_SIZE)
                        }.background(Color.gray).cornerRadius(5)
                    }
                }
                Spacer()
            }
            if(player.hasCards){
                Divider()
                Text("Cards").font(.title3).bold()
                ForEach (player.throwablesArray) { card in
                    HStack{
                        Text(card.name!)
                        Spacer()
                    }
                }
                ForEach (player.rockInStonesArray) { card in
                    HStack {
                        Text(card.name!)
                        Spacer()
                    }
                }
            }
        }
    }
}
