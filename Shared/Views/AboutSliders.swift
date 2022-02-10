//
//  AboutSliders.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 28.06.21.
//

import SwiftUI

struct AboutSliders: View {
    
    @State var sliderValue: Double = 3
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            Text("Rating:")
            Text(
                String(format: "%.1f", sliderValue) // Formats decimal points.
//                "\(sliderValue)"
            
            )
            .foregroundColor(color)
//            Slider(value: $sliderValue)
//            Slider(value: $sliderValue, in: 1...5)
//            Slider(value: $sliderValue, in: 1...5, step: 0.5)
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 0.5,
                onEditingChanged: { _ in // Remove bool because we don't need it.
                    color = .green
                },
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("5"),
                label: {
                    Text("Title")
                })
        }
        .navigationTitle("Sliders")
        .padding(50)
    }
}

struct AboutSliders_Previews: PreviewProvider {
    static var previews: some View {
        AboutSliders()
    }
}
