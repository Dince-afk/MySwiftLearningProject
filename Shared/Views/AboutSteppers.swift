//
//  AboutSteppers.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 27.06.21.
//

import SwiftUI

// MARK: - Stepper in App
struct AboutSteppers: View {
    @State var rectangleHeight: CGFloat = 100
    @State var rectangleWidth: CGFloat = 100
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: rectangleWidth, height: rectangleHeight)
                .animation(.easeInOut, value: [rectangleWidth,rectangleHeight])
        }
        .navigationTitle("Steppers")
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Stepper("Height: \(String(format: "%.0f", rectangleHeight))", value: $rectangleHeight, in: 0...1000, step: 50)
                Spacer()
                Stepper("Width: \(String(format: "%.0f", rectangleWidth))", value: $rectangleWidth, step: 50)
                
                Spacer()
            }
        }
        
        
    }
}

// MARK: - Example Stepper Sleep Hours

struct SleepHoursStepper: View {
    @State private var sleepHours = 8.0
    
    var body: some View {
        GroupBox {
            Stepper("\(sleepHours.formatted()) hours", value: $sleepHours, in: 0...23, step: 0.5)
                .padding()
        } label: {
            Label("Sleep Hours", systemImage: "moon.fill")
        }

        
    }
}


struct AboutSteppers_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutSteppers()
        }
        SleepHoursStepper()

    }
}
