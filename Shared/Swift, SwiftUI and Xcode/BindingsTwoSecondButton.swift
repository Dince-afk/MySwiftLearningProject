//
//  BindingsTwoSecondButton.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 16.06.21.
//

import SwiftUI

struct BindingsTwoSecondButton: View {
    
    @Binding var title: String
    
    var body: some View {

        Button(action: {
            title = "Button 2 pressed"
        }, label: {
            Label(
                title: { Text("Button 2") },
                icon: { Image(systemName: "pin") }
)
        })
        .padding()
        .padding(.horizontal)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 10)

    }
}

struct BindingsTwoSecondButton_Previews: PreviewProvider {
    static var previews: some View {
        // This is how to deal with asked input for binding variable.
        BindingsTwoSecondButton(title: .constant("Title"))
    }
}
