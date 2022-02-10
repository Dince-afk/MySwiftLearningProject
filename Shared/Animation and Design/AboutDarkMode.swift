//
//  AboutDarkMode.swift
//  MySwiftUI
//
//  Created by Dino Curic on 29.06.21.
//

import SwiftUI

struct AboutDarkMode: View {
    
    @State var currentColorScheme: ColorScheme = .dark // This is mine. Change the color scheme in NavigationView.
    @Environment(\.colorScheme) var colorScheme // This one is from youtube to check the color scheme. Could probably use the top one, too. EDIT: and I actually had to. This one isn't working. 
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("This Color is primary")
                    .foregroundColor(.primary)
                Text("This Color is secondary")
                    .foregroundColor(.secondary)
                Text("This Color is black")
                    .foregroundColor(.black)
                Text("This Color is white")
                    .foregroundColor(.white)
                Text("This Color is red")
                    .foregroundColor(.red)
                Text("This Color is globally adaptive")
                    .foregroundColor(Color("customColor"))
                
                Text("This Color is locally adaptive")
                    .foregroundColor(currentColorScheme == .light ? .green : .yellow)
                
                Text("This Background is Color(UIColor.\nsecondarySystemBackground)")
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                Text("This Background is Color(UIColor.\ntertiarySystemBackground)")
                    .padding()
                    .background(Color(UIColor.tertiarySystemBackground))
                    .cornerRadius(10)
                
            }
            .font(.title3)
            .multilineTextAlignment(.center)
            
        
        Spacer()
        
        
        
        }
        .navigationTitle("Dark Mode")
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Button("Switch Mode") {
                    if currentColorScheme == .dark {
                        currentColorScheme = .light
                    } else {
                        currentColorScheme = .dark
                    }
                }
                Spacer()
            }
        }
//        .colorScheme(currentColorScheme)
        .preferredColorScheme(currentColorScheme)
    }

}

struct DarkModes_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutDarkMode()
        }
    }
}
