//
//  AboutStates.swift
//  Scrumdinger
//
//  Created by Dino Curic on 13.06.21.
//

import SwiftUI

struct AboutStates: View {
    // @State means: "hey AboutStates: View, keep a look out for that variable because it might change and you'll might need to updated yourself in case it does.
    @State var backgroundColor: Color = Color.green
    @State var title: String = "Title"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            backgroundColor // Background
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("\(title)")
                    .font(.title)
                    .foregroundColor(.white)

                Text("Buttons \(count) pressed")
                    .font(.headline)
                    .foregroundColor(.white)

                HStack(spacing: 20) {
                    Button("Button 1") {
                        backgroundColor = .red
                        title = "Background color is \(backgroundColor.description) now"
                        count += 1
                    }
                    Button("Button 2") {
                        backgroundColor = .purple
                        title = "Background color is \(backgroundColor.description) now"
                        count += 1
                    }
                }
            }
        }
    }
}

struct AboutStates_Previews: PreviewProvider {
    static var previews: some View {
        AboutStates()
    }
}
