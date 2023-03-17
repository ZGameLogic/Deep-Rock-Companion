//
//  DeepDiveRulesView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 3/12/23.
//

import SwiftUI

struct DeepDiveRulesView: View {
    var body: some View {
        ScrollView {
            Text("Deep Dive Rules").font(.title).padding()
            Text("Playing the DEEP DIVE CAMPAIGN is challenging as you play the missions without any rest at the Space Rig between the missions; you have to make do with any equipment etc. that you find during missions. If your group decides to play the game as a Deep Dive campaign, the following rules apply:\n\t• Do not restock on Health, Ammo, Rock & Stone cards or Throwables between missions. Only take back character specific tokens, such as Platforms for the Engineer, or Ziplines for the Gunner.\n\t• Keep what Ammo, Health, Throwables, Rock & Stone cards and secondary weapon Overclocks you currently have.\n\t• Keep up to one Weapon Upgrade. Any excess ones must be discarded to the shared stash, but you will be compensated with one extra Throwable per discarded upgrade.\n\t• Remove all collected Minerals and pickups, as the content of the M.U.L.E. is shipped back to the Company.\n\t• Each successful mission grants a free Rock & Stone card to each Dwarf that made it back into the Drop Pod.\n\t• If you fail any mission, you can replay the current mission, using the normal setup rules (but then you lose any gained upgrades, etc. from earlier missions. Basically, you are restarting the Deep Dive campaign with fresh dwarves, but from this mission).").padding()
        }
    }
}

struct DeepDiveRulesView_Previews: PreviewProvider {
    static var previews: some View {
        DeepDiveRulesView()
    }
}
