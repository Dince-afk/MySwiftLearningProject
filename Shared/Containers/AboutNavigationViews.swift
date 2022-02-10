
//  AboutNavigationViews.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 17.06.21.
//

import SwiftUI

struct AboutNavigationViews: View {
    var body: some View {
        VStack(spacing: 50) {
            NavigationLink("Go to next View",
                           destination: MyOtherView())
        }
        .navigationBarTitle("Navigation Views")
        .navigationBarTitleDisplayMode(.automatic) // Default: automatic.
        
        // Adding custom bar items.
        .navigationBarItems(leading: Image(systemName: "person.fill"), trailing: NavigationLink(
            destination: Text("Settings"),
            label: {
                Image(systemName: "gear")
            })
        )
    }
}


struct MyOtherView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                // If you hide the back button you can use a costum one.
                Button("Back Button") {
                    presentationMode.wrappedValue.dismiss()
                }
                // This often makes sense. Now you can customize this view.
                
                NavigationLink("Next Screen", destination: Text("Last Subview"))
            }
            Text("The Back Button triggers presentationMode.wrappedValue.dismiss(), which lets us return to the previous View. Needed when we've hidden the Navigation Bar.").font(.footnote).foregroundColor(.secondary).padding()
        }
        .navigationTitle("Second Screen")
        .navigationBarHidden(true)
    }
}

struct AboutToolbarItems: View {
    var body: some View {
        NavigationView {
            GroupBox {
                Text("You can place several objects inside the toolbar.")
            } label: {
                Label("Toolbar Items", systemImage: "hammer")
            }
            .navigationTitle("Toolbar Items")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Test") { }
                    Button("Hello") { }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Enter") { }.buttonStyle(.bordered)
                }
            }

        }
    }
}



struct Navigations_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutNavigationViews()
        }
        AboutToolbarItems()
    }
}
