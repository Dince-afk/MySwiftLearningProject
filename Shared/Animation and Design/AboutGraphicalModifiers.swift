//
//  AboutGraphicalModifiers.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 28.06.21.
//

import SwiftUI

struct AboutGraphicalModifiers: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Circle with .stroke")
                Circle()
                    .stroke(lineWidth: 10)
                    .padding()
                    .frame(width: 300 , height: 300)
                Divider()
                
                Text("Cirlce with .fill(Color)")
                Circle()
                    .fill(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                    .padding()
                    .frame(width: 300 , height: 300)
                Divider()
                
                
                Text("Circle with .trim(from: 0.25, to 1.0)")
                Circle()
                    .trim(from: 0.25, to: 1.0)
                    .stroke(lineWidth: 10)
                    .padding()
                    .frame(width: 300 , height: 300)
                Divider()
                Group {
                    Text("Circle with .offSet(x: 100, y: 50)")
                    Circle()
                        .stroke(lineWidth: 10)
                        .padding()
                        .frame(width: 300 , height: 300)
                        .offset(x: 100, y: 50)
                        .overlay(Circle()
                                    .stroke(lineWidth: 10)
                                    .padding()
                                    .frame(width: 300 , height: 300)
                                    .opacity(0.3))
                    
                    Divider()
                }
                
                
                
                
            }
        }
        .navigationTitle("Graphical Modifiers")
        
        
    }
}

struct GraphicalModifiers_Previews: PreviewProvider {
    static var previews: some View {
        AboutGraphicalModifiers()
    }
}
