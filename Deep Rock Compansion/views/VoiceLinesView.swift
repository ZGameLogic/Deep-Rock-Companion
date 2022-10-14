//
//  VoiceLinesView.swift
//  Deep Rock Compansion
//
//  Created by Benjamin Shabowski on 10/13/22.
//

import SwiftUI

struct VoiceLinesView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(1..<100) { i in
                    Text("\(i)").padding()
                }
            }
        }
    }
}

struct VoiceLinesView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceLinesView()
    }
}
