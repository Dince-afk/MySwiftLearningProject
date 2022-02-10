//
//  AboutModels.swift
//  MySwiftUI
//
//  Created by Dino Curic on 29.06.21.
//

import SwiftUI

// MARK: - Example: User with four properties
struct UserModel: Identifiable {
    var id = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
    
}

struct AboutModels: View {
    @State var users: [UserModel] = [
        UserModel(displayName: "Dino", userName: "Dino Curic", followerCount: 10, isVerified: true),
        UserModel(displayName: "Belma", userName: "Belma Günther", followerCount: 15, isVerified: false),
        UserModel(displayName: "Began", userName: "Began Curic", followerCount: 100, isVerified: false),
        UserModel(displayName: "Sefika", userName: "Sefika Curic", followerCount: 1421, isVerified: true)
    ]
    
    var body: some View {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 35, height: 35)
                        Text(user.displayName)
                            .font(.headline)
                        Spacer()
                        
                        Image(systemName: user.isVerified ? "checkmark.seal.fill" : "")
                            .foregroundColor(.blue)
                        
                        VStack {
                            Text(String(user.followerCount))
                                .font(.headline)
                            Text("Followers")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        
                    }
                    .padding(.vertical, 10)
                    
                }
            }
            .navigationTitle("Model")
//            .listStyle(InsetGroupedListStyle()) 
        
    }
}

struct AboutModels_Previews: PreviewProvider {
    static var previews: some View {
        AboutModels()
    }
}
