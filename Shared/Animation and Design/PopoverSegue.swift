//
//  PopoverSegue.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 17.06.21.
//

// MARK: - Using .sheet, .transition or .animation.

import SwiftUI

struct PopoverSegue: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Button("Button") {
                    showView.toggle()
                }
                .font(.title)
                Spacer()
            }
            
            // MARK: - Method 3:
            NewView(showView: $showView)
                .padding(.top, 100)
                .offset(y: showView ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())

            
//            // MARK: - Method 2:
//            ZStack { // ZStack is put on so that the transition out of view works fine.
//                if showView {
//                    NewView(showView: $showView)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                }
//            }
//            .zIndex(2.0)
            
            
        }
        // MARK: - Method 1:
//        .sheet(isPresented: $showView, content: {
//            NewView()
//        })
        
        

        
        
        
    }
}

struct NewView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showView: Bool
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
             Color.purple.ignoresSafeArea()
            
            Button(action: {
//                presentationMode.wrappedValue.dismiss() // Method 1
                showView.toggle()
                
                
            }, label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
            })
        }
    }
}


struct PopoverSegue_Previews: PreviewProvider {
    static var previews: some View {
        PopoverSegue()
    }
}
