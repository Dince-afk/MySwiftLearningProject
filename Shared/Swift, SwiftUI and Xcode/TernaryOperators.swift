//
//  TernaryOperators.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 17.06.21.
//

import SwiftUI

struct TernaryOperators: View {
    
    @State var isStartingState: Bool = false
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(isStartingState ? Color.blue : Color.red)
                .frame(width: 250, height: 150)
            Button("Button") {
                withAnimation {
                    isStartingState.toggle()
                }
            }.buttonStyle(.bordered)
        }
        
    }
}

struct TernaryOperators_Previews: PreviewProvider {
    static var previews: some View {
        TernaryOperators()
    }
}
