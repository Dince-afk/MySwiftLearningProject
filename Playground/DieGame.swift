//
//  DieGame.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 22.11.21.
//

import SwiftUI

struct DieGame: View {
    @State private var dieNumber = 1
    @State private var rotationValue = 0.0
    
    
    var body: some View {
        
        Button(action: {
            dieNumber = Int.random(in: 1...6)
            withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                rotationValue += 360
            }
        }, label: {
            Image(systemName: "die.face.\(dieNumber).fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundStyle(.white, .red)
                
                
        })
            .rotation3DEffect(Angle(degrees: rotationValue), axis: (x: 1, y: 1, z: 1))

        
        
    }
}

struct DieGame_Previews: PreviewProvider {
    static var previews: some View {
        DieGame()
    }
}
