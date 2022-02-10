//
//  PlayAudio.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 13.06.21.
//


import SwiftUI
import AVKit

class SoundManager {
    // This instance is a class property. By creating it you just have to access the class property and don't need to create an actual instance of SoundManger. The method can then be accessed like this:                 "SoundManager.instance.playSound(sound: .ja)"
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    // Enums help streamlining
    enum SoundFile: String {
        case ja
        case nein
        case weiter
    }
    
    func playSound(sound: SoundFile) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    // Mine. No idea how.
    func stopSound() {
        player?.stop()
    }
    
}

struct PlaySounds: View {
    
    var body: some View {
        GroupBox("Mentalo") {
            VStack(spacing: 40) {
                Text("Drücke einen Button und lass Mentalo die spirituelle Welt für dich erkunden.")
                Image(systemName: "star")
                    .font(.largeTitle)
                HStack {
                    Button("Ja") {
                        SoundManager.instance.playSound(sound: .ja)
                    }
                    Button("Nein") {
                        SoundManager.instance.playSound(sound: .nein)
                    }
                    Button("Weiter") {
                        SoundManager.instance.playSound(sound: .weiter)
                    }
                    Button(role: .destructive, action: {
                        SoundManager.init().stopSound()
                    }, label: {
                        Text("Stop")
                    })
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
            }
            .padding()
        }
        
        //        .padding(20)
        //        .background(.regularMaterial)
        //        .clipShape(RoundedRectangle(cornerRadius: 10))
        //        .navigationBarTitle("Playing Sounds")
    }
}

struct PlayAudio_Previews: PreviewProvider {
    static var previews: some View {
        PlaySounds()
    }
}
