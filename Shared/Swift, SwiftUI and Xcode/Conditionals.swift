//
//  Conditionals.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 17.06.21.
//

import SwiftUI

struct Conditionals: View {
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        
        VStack {
            
            Button("Load it up") {
                isLoading.toggle()
            }
            
            
            Button("Show Circle: \(showCircle.description)") {
                showCircle.toggle()
            }
            Button("Rectangle Button: \(showRectangle.description)") {
                showRectangle.toggle()
            }
            
            if isLoading {
                ProgressView()
            }

            
            if showCircle {
                Circle()
                    .frame(width: 200, height: 200)
                
            }
            if showRectangle {
                Rectangle()
                    .frame(width: 200, height: 200)
            }
            
            
            Spacer()
        }
    }
}

struct Conditionals_Previews: PreviewProvider {
    static var previews: some View {
        Conditionals()
    }
}
