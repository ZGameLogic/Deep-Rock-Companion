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
        Text(deepDive.name)
    }
}

struct DeepDiveListView_Previews: PreviewProvider {
    static var previews: some View {
        DeepDiveListView(deepDive: DeepDive())
    }
}
