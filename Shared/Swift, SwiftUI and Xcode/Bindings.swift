//
//  Bindings.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 16.06.21.
//

import SwiftUI

struct Bindings: View {
    
    @State var backgroundColor: Color = .green
    @State var title: String = "This is the title"
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.title)
                ButtonView(backgroundColor: $backgroundColor)
                BindingsTwoSecondButton(title: $title)
            }
            
        }
    }
}

struct ButtonView: View {
    
    @Binding var backgroundColor: Color
    @State var buttonColor: Color = .blue
    
    var body: some View {
          
        Button(action: {
            backgroundColor = .orange
            buttonColor = .pink
        }, label: {
            Text("Button")
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .foregroundColor(.white)
                .cornerRadius(10)
        })
        
    }
}

struct Bindings_Previews: PreviewProvider {
    static var previews: some View {
        Bindings()
    }
}
