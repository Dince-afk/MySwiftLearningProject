//
//  AboutColorPickers.swift
//  MySwiftUI
//
//  Created by Dino Curic on 29.06.21.
//

import SwiftUI

struct AboutColorPickers: View {
    
    @State var pickedRectangleColor: Color = .red
    @State var pickedBackgroundColor: Color = .white
    
    var body: some View {
        ZStack {
            pickedBackgroundColor.ignoresSafeArea(.all)
            
            VStack(spacing: 40) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(pickedRectangleColor)
                    .frame(width: 300, height: 200)
                ColorPicker("Rectangle Color", selection: $pickedRectangleColor, supportsOpacity: true)
                ColorPicker("Background Color", selection: $pickedBackgroundColor, supportsOpacity: true)
                
            }
            .padding()
        }
        .navigationBarTitle("Color Pickers")
    }
}


struct AboutColorPickers_Previews: PreviewProvider {
    static var previews: some View {
        AboutColorPickers()
    }
}
