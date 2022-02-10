//
//  SafeAreas.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 13.06.21.
//

import SwiftUI

struct SafeAreas: View {
    var body: some View {
        
        // By using ZStacks
        ZStack {
            // Background Color
            Color.red
                .ignoresSafeArea()
            
            
            // Foreround Stuff
            Text("Hello, World!")
                .font(.title)
                .foregroundColor(.white)
            
        }
        
        // Or by using the background method
        ScrollView {
            Text("Hello")
                .font(.largeTitle)
            ForEach(0..<10) { _ in
                Rectangle()
                    .frame(width: 300, height: 150)
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.green
                .ignoresSafeArea()
        )

        
    }
    
    
    
    
}

struct SafeAreas_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreas()
    }
}
