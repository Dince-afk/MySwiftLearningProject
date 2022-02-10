//
//  ExtractedViews.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 16.06.21.
//

import SwiftUI

struct ExtractedViews: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)).ignoresSafeArea()
            contentLayer
        }
    }
    var contentLayer: some View {
        HStack {
            MyItem(title: "Oranges", count: 10, color: .orange)
            MyItem(title: "Apples", count: 1, color: .red)
            MyItem(title: "Bananas", count: 4, color: .yellow)
        }
    }
}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text("\(title)")
        }
        .padding()
        .background(color)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct ExtractedViews_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedViews()
    }
}
