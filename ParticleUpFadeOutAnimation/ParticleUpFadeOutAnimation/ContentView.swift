//
//  ContentView.swift
//  ParticleUpFadeOutAnimation
//
//  Created by yohei on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating = true
    @State private var buddyOffset: CGFloat = 0

    var body: some View {
        ZStack {
            Image("note")
                .frame(width: 200, height: 450)
                .background(.red)
            particleAnimationView
         
        }
        .offset(y: buddyOffset)
            .id(self.isAnimating)
            .animation(self.isAnimating ? .easeInOut(duration: 1).repeatForever(autoreverses: true) : .easeInOut(duration: 1), value: buddyOffset)
        
            .onAppear() {
                withAnimation(.easeInOut(duration: 0.5)) {
                    buddyOffset = isAnimating ? 20 : 0
                }
            }
            .onChange(of: self.isAnimating) { newValue in
                
                withAnimation(.easeInOut(duration: 0.5)) {
                    buddyOffset = newValue ? 20 : 0
                }
            }
    }

    var particleAnimationView: some View {
        ZStack {
            ZStack {
                ForEach(0..<4) { index in
                    EEParticleView(delay: Double(index) * 0.5, buddyOffset: $buddyOffset)
                }
            }
                .frame(width: 100, height: 50)
                .background(.gray)
        }
    }


    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
