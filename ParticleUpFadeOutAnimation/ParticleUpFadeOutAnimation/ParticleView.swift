//
//  ParticleView.swift
//  ParticleUpFadeOutAnimation
//
//  Created by yohei on 2023/05/08.
//

import SwiftUI

protocol ParticleViewDelegate {
}

class ParticleViewModel {
}

struct EEParticleView: View {
    
    let delay: Double
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .opacity(isAnimating ? 0 : 1)
                .position(isAnimating ? CGPoint(x: geometry.size.width, y: 0) : CGPoint(x: 0, y: geometry.size.height))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                            isAnimating = true
                        }
                    }
                }
        }
    }
    
}

struct EEParticleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color(.gray)
            ZStack {
                
                ForEach(0..<10) { index in
                    EEParticleView(delay: Double(index) * 0.25)
                }
            }
            .edgesIgnoringSafeArea(.all)
            
        }
    }
}
