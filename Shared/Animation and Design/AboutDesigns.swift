//
//  ContentView.swift
//  April2020
//
//  Created by Dino Curic on 27.04.21.
//

import SwiftUI

// MARK: - Example Recipe App
struct ExampleRecipesApp: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("NEW RECIPE")
                            .font(Font.system(.caption, design: .default).weight(.semibold))
                            .foregroundColor(.blue)
                        Text("Bun chay")
                            .font(.title2)
                        Text("Vietnamese sumer delight")
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                    .padding(.leading, 10)
                    Image("bunChay")
                        .resizable()
                        .frame(height: 300)
                        .aspectRatio(contentMode: .fit)
                    
                    
                }
                VStack(alignment: .leading) {
                    Text("NEW RECIPE")
                        .font(Font.system(.caption, design: .default).weight(.semibold))
                        .foregroundColor(.blue)
                    Text("Falafel with hummus")
                        .font(.title2)
                        .offset(x: 0, y: 2)
                    Text("Hearty middle-eastern dish")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .offset(x: 0, y: 1)
                    Image("bunChay")
                        .resizable()
                        .frame(height: 300)
                        .aspectRatio(contentMode: .fit)
                }
                VStack(alignment: .leading) {
                    Text("NEW RECIPE")
                        .font(Font.system(.caption, design: .default).weight(.semibold))
                        .foregroundColor(.blue)
                    Text("Balkan grah")
                        .font(.title2)
                        .offset(x: 0, y: 2)
                    Text("Delicious bean stew")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .offset(x: 0, y: 1)
                    Image("bunChay")
                        .resizable()
                        .frame(height: 300)
                    .aspectRatio(contentMode: .fit)                        }
            }
        }
        
        .navigationBarTitle("Recipe Design")
        .navigationBarItems(trailing:                 Image("user")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 42, height: 42)
                                .clipped()
                                .mask(Circle())
                                .padding()
        )
    }
}


struct DesignRecipes_Previews: PreviewProvider {
    static var previews: some View {
            ExampleRecipesApp()
    }
    
}
