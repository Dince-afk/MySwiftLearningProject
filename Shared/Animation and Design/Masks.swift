//
//  Masks.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 07.07.21.
//

import SwiftUI

// MARK: Explanation
/*
 1. The mask modifier basically cuts (ausstechen) out the view based on an inserted view.
 2. Together with the geometry reader we can calculte the width of the mask. We use the selected rating divide it by the total number of possible rating (5) and multiple it by the geometries width.
 3. What we did: we created a stars view that is masked by a yellow rectangle.
 */

struct Masks: View {
    
    @State var rating: Int = 3
    
    var body: some View {
        ZStack {
            starsView.overlay(overlayView.mask(starsView))
        }
        .navigationTitle("Mask Modifier")
    }
    
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
//                    .foregroundColor(.yellow)
                    // alternative coloring
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false) // makes this view unclickable. Need to get to the tap gesture of starsView.
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                        
                    }
            }
        }
    }
    
}

struct Masks_Previews: PreviewProvider {
    static var previews: some View {
        Masks()
    }
}
