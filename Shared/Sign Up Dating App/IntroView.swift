//
//  IntroView.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 02.07.21.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
    var body: some View {
        ZStack {
            // background
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))]), center: .topLeading, startRadius: 5, endRadius: UIScreen.main.bounds.height).ignoresSafeArea()
            
            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(
                                    insertion: .move(edge: .bottom), removal: .move(edge: .top
                                    )))
            } else {
                OnboardingView()
                    .transition(.asymmetric(
                                    insertion: .move(edge: .top), removal: .move(edge: .bottom
                                    )))
            }
            
                    
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
