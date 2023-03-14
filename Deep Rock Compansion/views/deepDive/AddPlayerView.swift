//
//  AddPlayerView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/12/23.
//

import SwiftUI

var startingClass = "Gunner"

struct AddPlayerView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var players: [Player]
    @Binding var presenting: Bool
    @State var player: Player? = nil
    
    @ObservedObject var model = AddPlayerViewModel()
    
    @State var errorMessage = ""
    @State var showError = false
    
    @State var playerName = ""
    @State var classType = startingClass
    @State var health = 1
    
    @State var primaryGun = Data().classes[startingClass]![0]
    @State var primaryGunAmmo = 0
    @State var pUpgradeSlotOne = "none"
    @State var pUpgradeSlotTwo = "none"
    
    @State var secondaryGun = Data().secondaryWeapon[0]
    @State var secondaryGunAmmo = 0
    @State var secondaryGunOverclocked = false
    @State var sUpgradeSlotOne = "none"
    @State var sUpgradeSlotTwo = "none"
    
    init(players: Binding<[Player]>, presenting: Binding<Bool>, player: Player? = nil){
        if let player {
            playerName = player.playerName!
            health = Int(player.health)
            classType = player.classType!
            // primary gun stuff
            primaryGun = player.primaryGun!
            primaryGunAmmo = Int(player.primaryAmmo)
            if(player.primaryUpgrages!.count >= 1){
                pUpgradeSlotOne = player.primaryUpgradesArray[0]
            }
            if(player.primaryUpgrages!.count >= 2){
                pUpgradeSlotTwo = player.primaryUpgradesArray[1]
            }
            // secondary gun stuff
            secondaryGun = player.secondaryGun!
            secondaryGunAmmo = Int(player.secondaryAmmo)
            secondaryGunOverclocked = player.secondaryOverclocked
            if(player.secondaryUpgrades!.count >= 1){
                sUpgradeSlotOne = player.secondaryUpgradesArray[0]
            }
            if(player.secondaryUpgrades!.count >= 2){
                sUpgradeSlotTwo = player.secondaryUpgradesArray[1]
            }
            self.player = player
        }
        self._players = players
        self._presenting = presenting
    }
    
    var body: some View {
        Text("Add Player").font(.title).padding()
        Form {
            Section("General", content: {
                TextField("Player name", text: $playerName)
                Picker("Class", selection: $classType) {
                    Text("Gunner").tag("Gunner")
                    Text("Engineer").tag("Engineer")
                    Text("Scout").tag("Scout")
                    Text("Driller").tag("Driller")
                }.pickerStyle(.segmented)
                    .onChange(of: classType, perform: { newClass in
                        primaryGun = Data().classes[newClass]![0]
                    })
                Stepper(value: $health, in: 1...5) {
                    HStack{
                        Text("Health: ")
                        Text("\(health)").bold()
                    }
                }
            })
            
            Section("Primary Weapon", content: {
                Picker("Primary", selection: $primaryGun){
                    ForEach(Data().classes[classType]!, id: \.self){weapon in
                        Text(weapon).tag(weapon)
                    }
                }.pickerStyle(.segmented)
                Stepper(value: $primaryGunAmmo, in: 0...5) {
                    HStack{
                        Text("Ammo: ")
                        Text("\(primaryGunAmmo)").bold()
                    }
                }
                VStack {
                    Text("Upgrades").font(.title2)
                    HStack {
                        Stepper(label: {
                            Group {
                                Image(pUpgradeSlotOne).resizable().scaledToFit().frame(width: 68, height: 68)
                            }.frame(width: 70, height: 70).background(Color(red: 0.7, green: 0.7, blue: 0.7)).cornerRadius(10)
                        },onIncrement: {
                            pUpgradeSlotOne = Data().upgradeScroll(current: pUpgradeSlotOne, amount: 1)
                        }, onDecrement: {
                            pUpgradeSlotOne = Data().upgradeScroll(current: pUpgradeSlotOne, amount: -1)
                        })
                        Spacer()
                        Stepper(label: {
                            Group {
                                Image(pUpgradeSlotTwo).resizable().scaledToFit().frame(width: 68, height: 68)
                            }.frame(width: 70, height: 70).background(Color(red: 0.7, green: 0.7, blue: 0.7)).cornerRadius(10)
                        },onIncrement: {
                            pUpgradeSlotTwo = Data().upgradeScroll(current: pUpgradeSlotTwo, amount: 1)
                        }, onDecrement: {
                            pUpgradeSlotTwo = Data().upgradeScroll(current: pUpgradeSlotTwo, amount: -1)
                        })
                    }
                }
            })
            
            Section("Secondary Weaopon", content: {
                Picker("Secondary", selection: $secondaryGun){
                    ForEach(Data().secondaryWeapon, id: \.self){weapon in
                        Text(weapon).tag(weapon)
                    }
                }.pickerStyle(.menu)
                Stepper(value: $secondaryGunAmmo, in: 0...5) {
                    HStack{
                        Text("Ammo: ")
                        Text("\(secondaryGunAmmo)").bold()
                    }
                }
                Toggle(isOn: $secondaryGunOverclocked) {
                    Text("Overclocked")
                }
                VStack {
                    Text("Upgrades").font(.title2)
                    HStack {
                        Stepper(label: {
                            Group {
                                Image(sUpgradeSlotOne).resizable().scaledToFit().frame(width: 68, height: 68)
                            }.frame(width: 70, height: 70).background(Color(red: 0.7, green: 0.7, blue: 0.7)).cornerRadius(10)
                        },onIncrement: {
                            sUpgradeSlotOne = Data().upgradeScroll(current: sUpgradeSlotOne, amount: 1)
                        }, onDecrement: {
                            sUpgradeSlotOne = Data().upgradeScroll(current: sUpgradeSlotOne, amount: -1)
                        })
                        Spacer()
                        Stepper(label: {
                            Group {
                                Image(sUpgradeSlotTwo).resizable().scaledToFit().frame(width: 68, height: 68)
                            }.frame(width: 70, height: 70).background(Color(red: 0.7, green: 0.7, blue: 0.7)).cornerRadius(10)
                        },onIncrement: {
                            sUpgradeSlotTwo = Data().upgradeScroll(current: sUpgradeSlotTwo, amount: 1)
                        }, onDecrement: {
                            sUpgradeSlotTwo = Data().upgradeScroll(current: sUpgradeSlotTwo, amount: -1)
                        })
                    }
                }
            })
            
            Section("Inventory", content: {
                HStack {
                    Button(action: {
                        model.addThrowable(name: "none")
                    }, label: {Text("Add Grenade")}).buttonStyle(BorderlessButtonStyle())
                    Spacer()
                    Divider()
                    Spacer()
                    Button(action: {
                        model.addRockInStone(name: "")
                    }, label: {Text("Add R.I.S. Card")}).buttonStyle(BorderlessButtonStyle())
                }
                List {
                    ForEach(model.throwables, id: \.self) { value in
                        HStack {
                            Picker("", selection: model.stringBindingThrowable(for: value)){
                                ForEach(Data().grenades, id: \.self){grenade in
                                    Text(grenade).tag(grenade)
                                }
                            }.pickerStyle(.menu)
                            Spacer()
                        }
                    }.onDelete(perform: model.deleteThrowable)
                }
                List {
                    ForEach(model.rockInStones, id: \.self) { value in
                        HStack {
                            TextField("Rock in Stone card", text: model.stringBindingRockInStone(for: value))
                            Spacer()
                        }
                    }.onDelete(perform: model.deleteRockInStone)
                }
            })
            
            Button(action: validate, label: {
                HStack{
                    Spacer()
                    Text("Create Player")
                    Spacer()
                }
            })
        }.alert("Unable to add player",
                isPresented: $showError,
                actions: {
                Button("Okay", action: {})
            }, message: {
                Text("\(errorMessage)")
            })
    }
    
    private func validate(){
        var valid = true
        var message = ""
        
        if(playerName.isEmpty){
            message += "Missing player name"
            valid = false
        }
        
        if(valid){
            save()
        }else{
            errorMessage = message
            showError = true
        }
    }
    
    private func save(){
        let new = (player == nil)
        if(new){
            player = Player(context: viewContext)
        }
        if let player {
            player.playerName = playerName
            player.health = Int16(health)
            player.classType = classType
            player.primaryGun = primaryGun
            player.secondaryGun = secondaryGun
            player.primaryAmmo = Int16(primaryGunAmmo)
            player.secondaryAmmo = Int16(secondaryGunAmmo)
            player.secondaryOverclocked = secondaryGunOverclocked
            for card in pUpgradeToCardArray() {player.addToPrimaryUpgrages(card)}
            for card in sUpgradeToCardArray() {player.addToSecondaryUpgrades(card)}
            for card in RISToCardArray() {player.addToRockInStones(card)}
            for card in throwablesToCardArray() {player.addToThrowables(card)}
        }
        if(new){
            players.append(player!)
        }
        presenting = false
        print(presenting)
    }
    
    private func RISToCardArray() -> [Card]{
        var items: [Card] = []
        for card in model.rockInStones {
            items.append(upgradeToCard(name: card))
        }
        return items
    }
    
    private func throwablesToCardArray() -> [Card]{
        var items: [Card] = []
        for card in model.throwables {
            items.append(upgradeToCard(name: card))
        }
        return items
    }
    
    private func pUpgradeToCardArray() -> [Card] {
        var priUps: [Card] = []
        if(pUpgradeSlotOne != "none"){priUps.append(upgradeToCard(name: pUpgradeSlotOne))}
        if(pUpgradeSlotTwo != "none"){priUps.append(upgradeToCard(name: pUpgradeSlotTwo))}
        return priUps
    }
    
    private func sUpgradeToCardArray() -> [Card] {
        var secUps: [Card] = []
        if(sUpgradeSlotOne != "none"){secUps.append(upgradeToCard(name: sUpgradeSlotOne))}
        if(sUpgradeSlotTwo != "none"){secUps.append(upgradeToCard(name: sUpgradeSlotTwo))}
        return secUps
    }
    
    private func upgradeToCard(name: String) -> Card {
        let newItem = Card(context: viewContext)
        newItem.name = pUpgradeSlotOne
        return newItem
    }
}

public class AddPlayerViewModel: ObservableObject, Equatable {
    
    @Published var throwables : [String] = []
    @Published var rockInStones: [String] = []
    
    func addThrowable(name: String){
        throwables.append(name)
    }
    
   func deleteThrowable(offsets: IndexSet){
       offsets.map { $0 }.forEach{value in
           throwables.remove(at: value)
       }
    }
    
    func stringBindingThrowable(for value: String) -> Binding<String> {
        let index = throwables.firstIndex(of: value)!
        return Binding(get: {
            return self.throwables[index]
        }, set: {
            self.throwables[index] = $0
        })
    }
    
    func addRockInStone(name: String){
        rockInStones.append(name)
    }
    
   func deleteRockInStone(offsets: IndexSet){
       offsets.map { $0 }.forEach{value in
           rockInStones.remove(at: value)
       }
    }
    
    func stringBindingRockInStone(for value: String) -> Binding<String> {
        let index = rockInStones.firstIndex(of: value)!
        return Binding(get: {
            return self.rockInStones[index]
        }, set: {
            self.rockInStones[index] = $0
        })
    }
    
    public static func == (lhs: AddPlayerViewModel, rhs: AddPlayerViewModel) -> Bool {
        for throwable in lhs.throwables {
            if(!rhs.throwables.contains(throwable)){
                return true
            }
        }
        for rockInStone in lhs.rockInStones {
            if(!rhs.rockInStones.contains(rockInStone)){
                return true
            }
        }
        return false
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView(players: Binding.constant([]), presenting: Binding.constant(true))
    }
}