//
//  AboutAnimations.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 17.06.21.
//

import SwiftUI


// MARK: - Example Basic Animation
struct ExampleBasicAnimation: View {
    @State private var scaleValue = 1.0
    
    var body: some View {
        Button("Tap Me") { scaleValue += 1 }
        .buttonStyle(.borderedProminent)
        .scaleEffect(scaleValue)
        //        .blur(radius: (scaleValue - 1) * 1.5) // Start with 0 by subtracting 1
        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: scaleValue)
    }
}

// MARK: - Example Button with repeating circle pulsating
struct ExamplePulsatingRedCircleAnimation: View {
    @State private var animationValue = 1.0
    
    var body: some View {
        VStack {
            Button("Tap Me") {}
            .padding(100)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationValue)
                    .opacity(2 - animationValue)
                    .animation(
                        .easeOut(duration: 1)
                            .repeatForever(autoreverses: true),
                        value: animationValue
                    )
        )
        }
        .onAppear {
            animationValue = 2
        }
        
    }
}

// MARK: - Example Rotation Effect

struct ExampleRotationEffect: View {
    @State private var rotationValue = 0.0
    
    var body: some View {
        Button("Rotate Me") {
            withAnimation(.interactiveSpring()) {
                rotationValue += 360
            }
        }
        .padding(100)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(Angle(degrees: rotationValue), axis: (x: 0, y: 1, z: 0))
        .shadow(radius: 10)
    }
}



// MARK: - Animation Timing
struct AnimationTiming: View {
    
    @State var isAnimating: Bool = false
    @State private var animationTime = 3
    var idealRectanglesHeight: CGFloat = 70
    
    var body: some View {
        
        VStack(spacing: 20) {
            // easeIn is great for views coming entering your main view. easeOut for views leaving. All animations finish at the same time.
            Group {
                RoundedRectangle(cornerRadius: 20.0)
                    .overlay(Text(".linear").foregroundColor(.blue))
                    .frame(width: isAnimating ? UIScreen.screenWidth
                           : 90, height: idealRectanglesHeight)
                // Same speed of animation from start to finish.
                    .animation(.linear(duration: Double(animationTime)), value: isAnimating)
                
                //                .animation(.linear(duration: animationTime))
                
                RoundedRectangle(cornerRadius: 20.0)
                    .overlay(Text(".easeIn").foregroundColor(.blue))
                    .frame(
                        width: isAnimating ? UIScreen.screenWidth : 90,
                        height: idealRectanglesHeight)
                // Slow at animation start, linear/same the rest of it.
                    .animation(.easeIn(duration: Double(animationTime)), value: isAnimating)
            }
            Group {
                RoundedRectangle(cornerRadius: 20.0)
                    .overlay(Text(".easeInOut").foregroundColor(.blue))
                    .frame(
                        width: isAnimating ? UIScreen.screenWidth : 90,
                        height: idealRectanglesHeight)
                // Slow first, normal middle, slow last.
                    .animation(.easeInOut(duration: Double(animationTime)), value: isAnimating)
                
                RoundedRectangle(cornerRadius: 20.0)
                    .overlay(Text(".easeOut").foregroundColor(.blue))
                    .frame(
                        width: isAnimating ? UIScreen.screenWidth : 90,
                        height: idealRectanglesHeight)
                // Slow last.
                    .animation(.easeOut(duration: Double(animationTime)), value: isAnimating)
                
                RoundedRectangle(cornerRadius: 20.0)
                    .overlay(Text(".spring").foregroundColor(.blue))
                    .frame(
                        width: isAnimating ? UIScreen.screenWidth : 90,
                        height: idealRectanglesHeight)
                // A spring animation.
                    .animation(.spring(
                        response: 0.5, // animation time.
                        dampingFraction: 0.5, // the jump back effect. 1.0 is none.
                        blendDuration: 1.0), // no idea.
                               value: isAnimating)
            }
            
            
        }
        .padding(.horizontal, 30)
        .navigationBarTitle("Animation Timing")
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Stepper(value: $animationTime, in: 0...20, step: 1) {
                    Text("Time: \(animationTime)")
                }
                Spacer()
                Button("Start Animation") {
                    isAnimating.toggle()
                }
            }
        }
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

// MARK: - Example: Repeat Forever
struct ExampleRepeatForever: View {
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Button("Button") {
                //                 Anything that is going to be effected by this toggle is going to be animated.
                withAnimation(
                    Animation
                        .default
                        .repeatForever(autoreverses: true))
                {
                    isAnimated.toggle()
                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 100 : 25)
                .fill(isAnimated ? Color.red : Color.green)
                .frame(
                    width: isAnimated ? CGFloat(100) : 300,
                    height: isAnimated ? CGFloat(100) : 300)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
            // Use this modifier to animate only this view, not everything that's connected to isAnimated.
                .animation(.default.repeatForever(), value: isAnimated)
            Spacer()
        }
    }
}




struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        ExampleBasicAnimation()
        ExamplePulsatingRedCircleAnimation()
        ExampleRotationEffect()
        AnimationTiming()
        ExampleRepeatForever()
        
    }
}
