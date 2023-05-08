//
//  ContentView.swift
//  ParticleUpFadeOutAnimation
//
//  Created by yohei on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ForEach(0..<10) { index in
                EEParticleView(delay: Double(index) * 0.25)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
