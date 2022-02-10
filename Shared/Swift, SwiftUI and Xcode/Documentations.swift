//
//  Documentations.swift
//  MySwiftUI
//
//  Created by Dino Curic on 29.06.21.
//

import SwiftUI

// MARK: - PROPERTIES
struct Documentations: View {
    @State var data = ["Apples", "Oranges", "Bananas"]
    @State var showAlert = false
    /*
     This is a multi-line comment.
     Very convinient and clean.
     I like it.
     Press command + alt + left to fold it. And right to unfold.
     */
    var body: some View {
        // MARK: - BODY
        NavigationView { // START: NAV
            ZStack {
                // background
                Color.orange.ignoresSafeArea()
                // foreground
                foregroundLayer
                    .navigationTitle("Documentation")
                    .toolbar {
                        Button("ALERT") {showAlert.toggle()}
                    } // END: TOOLBAR
                // TODO: Implement something.
                    .alert(isPresented: $showAlert, content: {
                        returnAlert(alertMessage: "Error")
                        // FIXME: Fix something.
                    })
            } // END: ZSTACK
        } // END: NAVI
    } // END: BODY
    // MARK: - VIEWS
    /// This is the foreground layer that holds a ScrollView
    private var foregroundLayer: some View {
        ScrollView { // START: LIST
            VStack(spacing: 30) {
                ForEach(0..<5) { _ in
                    ForEach(data, id: \.self) { fruit in
                        Text(fruit)
                    }
                } // END: FOREACH
            } // END: VSTACK
        } // END: LIST
        .padding()
    } // END: VIEW
    
    // MARK: - FUNCTIONS
    
    /// Gets an alert with a specified title.
    ///
    /// This is going to hold the discussion. This function returns an alert immediatlly. This alert will add a title. Below this come fake example code.
    ///
    /// ```
    /// returnAlert(alertMessage: "Hi") -> Alert(title: "Hi")
    /// ```
    /// - Warning: There is no additonal message in this alert.
    /// - Parameter alertMessage: This is the title for the alert.
    /// - Returns: Returns the alert with the title.
    func returnAlert(alertMessage: String) -> Alert {
        return Alert(title: Text(alertMessage))
    }
}
// MARK: - PREVIEW
struct Documentations_Previews: PreviewProvider {
    static var previews: some View {
        Documentations()
    }
}
