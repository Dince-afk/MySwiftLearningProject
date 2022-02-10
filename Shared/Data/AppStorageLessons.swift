//
//  UserDefaultLessons.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 02.07.21.
//

import SwiftUI


// MARK: User Defaults
/*
 Data changes do not stay (get saved) inbetween app sessions (opening an app, closing it).
 
 UserDefaults was the standard way up till now, with AppStorage replacing it.
 
 Even when reinstalling the app over xcode it still save the AppStorage.
 */

struct AppStorageLessons: View {
    
    
    // This was the old way.
//    @State var currentUserName: String?
    
    
    @AppStorage("name") var currentUserName: String?
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            // ?? means: value a nil? then return "Add Name Here"
            Text(currentUserName ?? "Your Name")
            
            // Same as:
//            if let name = currentUserName {
//                Text(name)
//            }
            
            TextField("Enter Name", text: $textFieldText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            
            
            Button("Save") {
//                Obsolete
//                let name = "Dino"
                currentUserName = textFieldText
                textFieldText = ""
                
                // That's also obsolete
//                UserDefaults.standard.set(name, forKey: "name")
            }
            
        }
        .padding()
        
//        .onAppear {
//            currentUserName = UserDefaults.standard.string(forKey: "name")
//        }
    }
}

struct UserDefaultLessons_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageLessons()
    }
}
