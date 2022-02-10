//
//  AboutOnAppearAndDisappear.swift
//  MySwiftUI
//
//  Created by Dino Curic on 29.06.21.
//

import SwiftUI

struct AboutOnAppearAndDisappear: View {
    
    @State var text = "In 5 seconds new text will appear."
    @State var count: Int = 0
    
    var body: some View {
        
            ScrollView {
                VStack(spacing: 20) {
                    Text(text)
                    Text("The layout below is a LazyVStack, meaning it will only load the RoundedRectangles once it's about to come into view. OnAppear counts += 1 in Navigation Title.")
                }
                .padding()
                LazyVStack {
                    ForEach(0..<50) { index in
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color.gray)
                            .overlay(Text(String(index)).foregroundColor(.blue).font(.title))
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }

                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    text = "This is my new on appear text."
                }
            })
            .onDisappear(perform: {
                // We would never see this in our demo. This is mostly used to clean running functions in no longer needed.
            })
            .navigationTitle("LazyVStack, onAppear: \(count)")
        
        
    }
}

struct OnAppearAndDisappear_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        AboutOnAppearAndDisappear()
        }
    }
}
