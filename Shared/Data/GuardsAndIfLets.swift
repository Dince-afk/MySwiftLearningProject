//
//  GuardsAndIfLets.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 28.06.21.
//

import SwiftUI

struct GuardsAndIfLets: View {
    
    @State var currentUserId: String? = nil
    @State var displayText: String? = nil
    @State var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        Text("There are two nil properties. One for the User ID and for the displayText. On appear they are changed but checked with guard let and if let. Log in/out button toggles User ID between Dino and nil.")
                        Spacer(minLength: 100)
                        
                        // If displayText is not nil, create a constant with its non nil value and use it in the Text View.
                        if let text = displayText {
                            Text(text)
                                .font(.title3)
                        }
                        
                        if isLoading {
                            ProgressView()
                        }
                        
                        
                        Spacer()
                    }
                    .padding()
                }
                Button("Log in/out") {
                    if currentUserId != nil  {
                        currentUserId = nil
                    } else {
                        currentUserId = "Dino"
                    }
                    
                    loadData()
                }

            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadData2()
        }

            
        }
    }
    
    // MARK: - This is the if let way
    func loadData() {
        
        if let userID = currentUserId {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is the new data! User ID is \(userID)"
                isLoading = false
            }
        } else {
            displayText = "Error there is no user ID"
        }
        
    }
    
    // MARK: - This is the guard let way
    func loadData2() {
        // Create a new constant called userID and it will be the value that is in currentUserId. If curentUserId is equal to nil, we won't be able to create this new constant userID and then the else statement will run.
        guard let userID = currentUserId else {
            // if it is not succesful, i.e. nil found.
            displayText = "Error there is no user ID"
            return // Once this return is run the function ends. The code below will not be executed.
        }
        
        // If guard let the value in currentUserId through, this code will be run:
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new data! User ID is \(userID)"
            isLoading = false
        }
    }
    
}

struct GuardsAndIfLets_Previews: PreviewProvider {
    static var previews: some View {
        GuardsAndIfLets()
    }
}
