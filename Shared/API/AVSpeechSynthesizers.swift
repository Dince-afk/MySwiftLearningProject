//
//  AVSpeechSynthesizers.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 07.07.21.
//

import SwiftUI
import AVFoundation

struct AVSpeechSynthesizers: View {
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "Hello")

    var body: some View {
        
        VStack {
            Button(action: {
                synth.speak(myUtterance)
            }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
        }
    }
}

struct AVSpeechSynthesizers_Previews: PreviewProvider {
    static var previews: some View {
        AVSpeechSynthesizers()
    }
}
