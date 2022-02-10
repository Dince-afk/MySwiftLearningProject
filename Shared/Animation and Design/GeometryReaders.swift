//
//  GeometryReaders.swift
//  MySwiftUI
//
//  Created by Dino Curic on 07.07.21.
//

import SwiftUI

// MARK: What is this?
/*
 1. Scenario: the .frame(width: UIScreen.main.bounds.width * 0.6666) runs into troubling when turning the screen, because it then still uses the width of the vertical mode, instead of the width of the horizontal mode. It's not adaptive to the screen's rotation. This is where the GeometryReader comes, among many other cases, into play.
 2. It works by basically assigning each object inside the GR the geometry value, which we can then use to change.
 3. NOTE: Geometry Readers cost a lot of computing power. The price is not cheap. So use 
 */


struct GeometryReaders: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).minX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 20),
                                axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        })
        
        
        //        GeometryReader { geometry in
        //            HStack(spacing: 0) {
        //                Rectangle().fill(Color.red)
        //                // Instead of this...
        ////                    .frame(width: UIScreen.main.bounds.width * 0.6666)
        //                // ... we can now use this:
        //                    .frame(width: geometry.size.width * 0.6666)
        //                Rectangle().fill(Color.blue)
        //            }
        //            .ignoresSafeArea()
        //        }
    }
}

struct GeometryReaders_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaders()
    }
}
