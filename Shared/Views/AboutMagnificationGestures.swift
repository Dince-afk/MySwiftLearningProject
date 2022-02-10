//
//  AboutMagnificationGestures.swift
//  MySwiftUI
//
//  Created by Dino Curic on 05.07.21.
//

import SwiftUI

struct AboutMagnificationGestures: View {
    
    // Tab 1
    @State var scaleValue: CGFloat = 1

    
    // Tab 2 + 3
    @State var magnifyingExtraValue: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    // Tab management
    @State var tabSelected: Int = 0
    
    var body: some View {
        
        
        TabView(selection: $tabSelected) {
            
            
            Text("1. Value from .onChanged in .scaleEffect")
                .font(.title)
                .padding(40)
                .background(Color.blue.cornerRadius(10))
                .scaleEffect(scaleValue)
                .gesture(
                    MagnificationGesture()
                        
                        // This method only deals with single magnifying gestures. Once a single gesture has been done (fingers did let go) the totalNewSize value is down gone = 0.
                        .onChanged { totalNewSize in
                            /*
                             This is the simplest way of dealing with magnificationGestures: create a scaleValue property that stores the value created in .onChanged (note: its magnitude property) and add it as the scaleEffect argument.
                             */
                            self.scaleValue = totalNewSize.magnitude
                        }
                        
                        .onEnded { value in
                            
                        }
                    
                )
                .tag(0)
            
            
            Text("2. .onChanged + .onEnded values together in .onScale")
                .font(.title)
                .padding(40)
                .background(Color.green.cornerRadius(10))
                .scaleEffect(1.0 + magnifyingExtraValue + lastAmount )
                .gesture(
                    MagnificationGesture()
                        .onChanged { totalNewSize in
                            /* We want a CGFloat value that represents the amount of surplus that's created by the magnifying gesture. "totalNewSize" is the objects total size (before magn. together with magn. surplus).
                            To get only the magnifyingExtraValue we subtract 1 from the totalNewSize. totalNewSize = 1 (normal size of object) + magnifyingExtraValue.
                             This magnifyingExtraValue we than want to add to the .scaleEffect to create the magnifying scale effect. 1.0 in there means, the object should be in a normal, unscaled state = 1.0. E.g.: 10 % scale equals 1.1.
                             We could also simply add totalNewSize as the sole property in the scale effect. See
                             */
                            self.scaleValue = totalNewSize.magnitude
                            magnifyingExtraValue = totalNewSize - 1
                        }
                        // This method give us the opportunity to execute code right before end the gesture (fingers let go). In this example we keep track of the last amount by storing the magnifyingExtraValue inside lastAmount and reset (zero) magnifyingExtraValue, so that the next .onChanged values can be freshly stored inside magnifyingExtraValue once again.
                        .onEnded { value in
                            lastAmount += magnifyingExtraValue
                            magnifyingExtraValue = 0
                            
                        }
                    
                )
                .tag(1)
            
            VStack(spacing: 10) {
                Text("3. This is a real-life example.")
                    .font(.title)
                HStack {
                    Circle().frame(width: 35, height: 35)
                    Text("Dino Curic")
                    Spacer()
                    Image(systemName: "ellipsis")
                    
                }
                .padding(.horizontal)
                
                
                
                Rectangle()
                    .frame(height: 300)
                    .scaleEffect(1 + magnifyingExtraValue)
                    .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            // value is basically the magnification amount in CGFloat.
                            // currentAmount should store
                            magnifyingExtraValue = value - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                magnifyingExtraValue = 0
                            }
                            
                        }
                    )
                
                
                HStack {
                    Image(systemName: "heart.fill")
                    Image(systemName: "text.bubble.fill")
                    Spacer()
                }
                .padding(.horizontal)
                .font(.headline)
                Text("This is a caption for this photo")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            .tag(2)
            
            
        }
        .navigationTitle("Magnification Gestures")
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct MagnificationGestures_Previews: PreviewProvider {
    static var previews: some View {
        AboutMagnificationGestures()
    }
}
