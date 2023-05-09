//
//  NoteView.swift
//  ParticleUpFadeOutAnimation
//
//  Created by yohei on 2023/05/08.
//

import SwiftUI

struct NoteView: View {
    var body: some View {
        Image("note")
            .renderingMode(.template)
            .foregroundColor(.white)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.gray)
            NoteView()
        }
    }
}
