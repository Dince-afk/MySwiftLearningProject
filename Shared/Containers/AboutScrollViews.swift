//
//  AboutScrollViews.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 12.06.21.
//

import SwiftUI

struct ComplexScrollView: View {
    var data: [String] = ["Hello","Dino","How are ya", "nice", "whatsup"]
    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(0..<10) { index in
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                            

                        }
                        
                    })
                }
            }
        }
        .navigationBarTitle("Complex Scroll View")
        
        
    }
}

struct PlaygroundOne_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ComplexScrollView()
        }
    }
}
