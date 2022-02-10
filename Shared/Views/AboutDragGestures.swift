//
//  DragGestures.swift
//  MySwiftUI
//
//  Created by Dino Curic on 07.07.21.
//

import SwiftUI

struct AboutDragGestures: View {
    
    
    // MARK: Explanation:
    /*
     1. GSSize is bacially just a type with a width and height values that represent the objects placement on screen?
     2. value.translation property in the two methods return such a CGSize type.
     3. To drag objects around we simply use the .offset method with the value from the DragGesture() method.
     */
    @State var tabSelected: Int = 0
    @State var offset: CGSize = .zero
    
    var body: some View {
        
        TabView(selection: $tabSelected) {
            
            // MARK: - Tab 1
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 100, height: 100)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offset = CGSize(width: 0, height: 0)
                            }
                        }
                    
                )
                .tag(0)
            
            // MARK: - Tab 2
            // MARK: Explanation
            /*
             1. This is a tinder like gesture and animation style.
             2. We include drag and move: .offset. Based on that we use scaleEffect and rotationEffect.
             */
            
            ZStack {
                VStack {
                    Text("\(offset.width)")
                    Spacer()
                }
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300, height: 500)
                        .offset(offset)
                        .scaleEffect(getScaleAmount())
                        .rotationEffect(Angle(degrees: getRotationAmount()))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    withAnimation(.spring()) {
                                        offset = value.translation
                                    }
                                    
                                }
                                .onEnded { value in
                                    withAnimation(.spring()) {
                                        offset = CGSize(width: 0, height: 0)
                                    }
                                }
                            
                        )
                        
                
            }
            .tag(1)
            
        }
        .navigationTitle("Drag Gestures")
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
            }
        }
    }
    
    // Tab 2
    func getScaleAmount() -> CGFloat {
        // The maximum amount the rectangle can be moved sideways before reaching the border.
        let max = UIScreen.main.bounds.width / 2
        
        // We only use .width because we don't need height. abs() is used to get the absolute value, meaning no negative numbers.
        let currentAmount = abs(offset.width)
        let percentage = currentAmount/max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        // No absolute values wanted, because if negative different rotation direction than positive.
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        // If we are a hundert percent to the edge we get an angle of 10, if fifty then 5.
        return percentageAsDouble * maxAngle
    }
    
}

struct DragGestures_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutDragGestures()
        }
    }
}
