//
//  AboutRotationGestures.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 06.07.21.
//

import SwiftUI

struct AboutRotationGestures: View {
    
    @State var angle: Angle = Angle(degrees: 0) // No rotation at the very start.
    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .padding(50)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                        
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                        
                    }
                
            )
            .navigationTitle("Rotation Gestures")
    }
}

struct RotationGestures_Previews: PreviewProvider {
    static var previews: some View {
        AboutRotationGestures()
    }
}
