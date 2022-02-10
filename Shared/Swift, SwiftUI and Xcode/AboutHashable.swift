//
//  AboutHashable.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 01.11.21.
//

import SwiftUI


struct MyCostumModel: Hashable {
    let title: String
}

struct AboutHashable: View {
    
    let data: [MyCostumModel] = [MyCostumModel(title: "One"), MyCostumModel(title: "Two"),MyCostumModel(title: "Three"),MyCostumModel(title: "Four"),MyCostumModel(title: "Five")]
 
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(data, id: \.self) { data in
                    Text(data.hashValue.description)
                }
            }
        }
    }
}

struct AboutHashable_Previews: PreviewProvider {
    static var previews: some View {
        AboutHashable()
    }
}
