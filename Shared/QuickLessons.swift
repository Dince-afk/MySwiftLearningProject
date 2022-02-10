//
//  QuickLessons.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 03.07.21.
//

import SwiftUI

struct QuickLessons: View {
    @State var quickLessons = quickLessonsArray
    
    var body: some View {
        List {
            ForEach(quickLessons, id: \.self) { lesson in
                Text(lesson)
            }
        }
        .listStyle(.inset)
        .navigationTitle("Short Lessons")
    }
}

struct QuickLessons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QuickLessons()
        }
    }
}

extension QuickLessons {
    
    static let quickLessonsArray: [String] = [
        #"If you want to use a computed property in a view to set a state properties initial value (like for example an initial date value for an alarm), set the computed property to static, because otherwise Xcode will complain."#,
        #"If we don't want to make a view "clickable" we can use the .allowsHitTesting(false) modifier."#,
        #"Use this to format Doubles to specific comma points: Text(String(format: "%.0f", age))". The 0 means, 0 after decimal points. You can also use the formatted() method, which basically offers the same result."#,
        "To move a view into the top third of the screen, use two spacers on the bottom and only one on top. Each spacer takes equal space, so there is a two (bottom) to one (top) ratio.",
        "Extensions are basically housekeeping fuctions. They extend views or files with properties or methods. To use them write @Extension: ObjectName { }.",
        #"Example of a more complicated ternary operator: Text(onboardingState == 0 ? "Sign up" : onboardingState == 3 ? "Finish" : "Next")"#,
        "Disable an animation for an object with .animation(nil)",
        "MVVM stands for Model (data), View (UI) and View Model (management of Models for View. A View Model is always? a class.",
        "CRUD Functions: Create, Read (get items), Update and Delete",
        "Use UserDefault in a class, and AppStorage in a View",
        "Add a frame around the view with a maxWidth of around 400 to deal with overstretching objects in horizontal mode.",
        "Use the StackNavigationViewStyle() to deal with NavigationViews showing a left view on iPads."
        
    ]
    
    
}
