//
//  ButtonLessons.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 05.07.21.
//



import SwiftUI

struct AboutButtons: View {
     @State var title = "Title"
    
    var body: some View {
        VStack(spacing: 30) {
            
            Button("Automatic Button") {
                
            }
            .buttonStyle(.automatic)

            Button("Borderless Button") {
                
            }
            .buttonStyle(.borderless)
            
            Button("Plain Button") {
                
            }
            .buttonStyle(.plain)

            
            Button("Bordered Button") {
                
            }
            .buttonStyle(.bordered)
            
            Button("Bordered Button") {
                
            }
            .buttonStyle(.bordered)
            .controlSize(.small)
            
            Button("Bordered Large Controll Size Button") {
                
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button("Bordered Destructive Button", role: .destructive) {
                
            }
            .buttonStyle(.bordered)
            
            Button("Bordered Prominent Button", role: .destructive) {
                
            }
            .buttonStyle(.borderedProminent)
            
            Button("Bordered Destructive Prominent Button") {
                
            }
            .buttonStyle(.borderedProminent)
            
            

            
            


            
            

            
        }
        .navigationTitle("Buttons")
        
    }
}

struct AboutButtonLessons_Previews: PreviewProvider {
    static var previews: some View {
        AboutButtons()
    }
}
