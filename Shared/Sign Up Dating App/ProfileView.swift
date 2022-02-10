//
//  ProfileView.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 03.07.21.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(currentUserName ?? "NAME")
            Text("This user is \(currentUserAge ?? 50) years old!")
            Text("Their gender is \(currentUserGender ?? "GENDER")")
            
            Button(action: {
                signOut()
            }, label: {
                Text("Sign out")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            
        }
        .font(.title)
        .foregroundColor(Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)))
        .padding()
        .padding(.vertical, 40)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        
        
    }
    func signOut() {
        withAnimation(.spring()) {
            currentUserName = nil
            currentUserAge = nil
            currentUserGender = nil
            currentUserSignedIn = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
