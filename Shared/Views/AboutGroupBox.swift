//
//  AboutGroupBox.swift
//  MySwiftUI
//
//  Created by Dino Curic on 31.10.21.
//

import SwiftUI
/*
 SwiftUI’s GroupBox view groups views together and places a light background color behind them so they stand out. You can optionally also include a header to make group titles, if you need to.
 */
struct AboutGroupBox: View {
    var body: some View {
        GroupBox(label: Label("Label", systemImage: "building.columns"),
            content: {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        
                    .padding()
            }
        )
            .padding()
        
    }
}

struct AboutGroupBox_Previews: PreviewProvider {
    static var previews: some View {
        AboutGroupBox()
    }
}
