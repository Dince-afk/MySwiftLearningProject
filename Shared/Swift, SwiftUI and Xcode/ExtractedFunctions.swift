//
//  ExtractedFunctions.swift
//  Scrumdinger
//
//  Created by Dino Curic on 13.06.21.
//

import SwiftUI

struct ExtractedFunctions: View {
    @State var backgroundColor: Color = Color.pink
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea() // Background
            VStack { // Content
                Text("Title")
                    .font(.largeTitle)
                Button(action: {
                    buttonPressed()
                }, label: {
                    Text("PRESS ME")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                })
            }
        }


    }
    func buttonPressed() {
        backgroundColor = .yellow
    }
}

struct ExtractedFunctions_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedFunctions()
    }
}
