//
//  AboutToggles.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 26.06.21.
//

import SwiftUI

struct AboutToggles: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        
        VStack {
            Toggle("Label", isOn: $toggleIsOn)
            
            Toggle("Label", isOn: $toggleIsOn)
                .toggleStyle(SwitchToggleStyle(tint: .red))
            
            Toggle("Label", isOn: $toggleIsOn)
                
        }
        .navigationBarTitle("Toggles")
        .padding()
    }
}

struct AboutToggles_Previews: PreviewProvider {
    static var previews: some View {
        AboutToggles()
    }
}
