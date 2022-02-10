//
//  OnTapsGestures.swift
//  MySwiftUI
//
//  Created by Dino Curic on 29.06.21.
//

import SwiftUI

struct AboutTapGestures: View {
    
    @State var tabSelected: Int = 0
    @State var isSelected = false
    
    // for longPressGesture
    @State var isComplete = false
    @State var isSuccess = false
    
    
    var body: some View {
        
        TabView(selection: $tabSelected) {
            
            // MARK: - Tab 1: Tap Gestures
            VStack(spacing: 40) {
                VStack(spacing: 10) {
                    Text("Buttons vs. OnTapGestures")
                        .font(.title3)
                    
                    Text("Buttons and OnTapGestures can often be used interchangeble.")
                        .font(.caption)
                }
                
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(height: 200)
                    .foregroundColor(isSelected ? .green : .red)
                
                Button(action: {
                    isSelected.toggle()
                }, label: {
                    Text("Button (with Button())")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(25)
                    
                })
                
                Text("Button (with .onTapGesture)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .onTapGesture {
                        isSelected.toggle()
                    }
                
                Text("Button (with .onTapGesture(count: 2)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .onTapGesture(count: 2) {
                        isSelected.toggle()
                    }
                
                Spacer()
            }
            .tag(0)
            
        
// MARK: - Tab 2: Long Press
            // LongPressGesture
            VStack(spacing: 30) {
                
                VStack(spacing: 10) {
                    Text("LongPressGesture: Loading View")
                        .font(.title3)
                    
                    Text("This method is not used that often outside of games. Still useful to know.")
                        .font(.caption)
                }
                Rectangle()
                    .fill(isSuccess ? Color.green : Color.blue)
                    .frame(maxWidth: isComplete ? .infinity : 0)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray)
                
                
                HStack(spacing: 30 ) {
                    Text("Click here")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .onLongPressGesture(
                            minimumDuration: 2.0) { (isPressing) in
                            // Start of press -> to the minDuration
                            if isPressing {
                                withAnimation(.easeInOut(duration: 2)) {
                                    isComplete = true
                                }
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    if !isSuccess {
                                        withAnimation(.easeInOut) {
                                            isComplete = false
                                            
                                        }
                                    }
                                }
                            }
                            
                        } perform: {
                            // from the minDuration
                            withAnimation(.easeInOut) {
                                isSuccess = true
                            }
                        }
                    
                    Text("Reset")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .onTapGesture {
                            isComplete = false
                            isSuccess = false
                        }
                    
                }
            }
            .tag(1)
        
        }
        .navigationTitle("Tap Gestures")
        .padding(20)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
    
}

struct AboutTagGestureLessons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutTapGestures()
            
        }
    }
}
