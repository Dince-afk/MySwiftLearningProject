//
//  AboutScrollViewReaders.swift
//  MySwiftUI
//
//  Created by Dino Curic on 07.07.21.
//

import SwiftUI

// MARK: What is this?
/*
 1. A ScrollViewReader is a ScrollView that can programatically scroll/start at a specific part in the ScrollView. Like in chat apps where the scroll viewer starts at the bottom, i.e. the latest message.
 2. To do that we can simply put a scroll view reader inside the scroll view and use the proxy value that know where each item in the scroll view is. Next we can use a button and call the proxy's method .scrollTo and put in the index we want to scroll to. NOTE: This only works if we add an id method to each item (.id(index)). Next you can also change the parameter of anchor, meaning where the item should be showed. On top, bottom etc.
 3. You can also add an animation to that action.
 4. To actually use a button outside the SV reader we can use the method .onChange
 */

struct AboutScrollViewReaders: View {
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Enter a number here", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            Button("Scroll now") {
                if let index = Int(textFieldText) { scrollToIndex = index }
            }
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item number \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex, perform: { value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .top)
                        }
                    })
                }
            }
        }
        .navigationTitle("Scroll View Reader")
    }
}

struct ScrollViewReaders_Previews: PreviewProvider {
    static var previews: some View {
        AboutScrollViewReaders()
    }
}
