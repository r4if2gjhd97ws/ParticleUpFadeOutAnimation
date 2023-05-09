//
//  ParticleView.swift
//  ParticleUpFadeOutAnimation
//
//  Created by yohei on 2023/05/08.
//

import SwiftUI

struct EEParticleView: View {

    let delay: Double
    @State private var isAnimating = false
    @State private var color: Color = .clear
    @Binding  var buddyOffset: CGFloat

    var body: some View {
        GeometryReader { geometry in
            NoteView()

//                .frame(width: 50, height: 50)
                .foregroundColor(color)

                .opacity(isAnimating ? 0 : 1)
                .position(isAnimating ? CGPoint(x: geometry.size.width, y: 0 ) : CGPoint(x: 0, y: geometry.size.height - buddyOffset))
                .onAppear {
                color = .clear
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    color = .white
                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {

                        isAnimating = true
                        print("isAnimating: \(isAnimating)")
                    }
                }
            }
        }
    }

}

struct EEParticleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ZStack {
                ForEach(0..<4) { index in
                    EEParticleView(delay: Double(index) * 0.5, buddyOffset: .constant(0))
                }
            }
                .frame(width: 100, height: 50)
                .background(.gray)
        }
    }
}
