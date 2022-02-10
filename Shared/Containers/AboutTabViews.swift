//
//  AboutTabViews.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 28.06.21.
//

import SwiftUI

struct AboutTabViews: View {
    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem { Label("Home", systemImage: "house.fill") }
                .tag(0)
            Text("BROWSE TAB")
                .tabItem { Label("Browse", systemImage: "globe") }
                .tag(1)

            Text("PROFILE TAB")
                .tabItem { Label("Profile", systemImage: "person.fill") }
                .tag(2)
        }
        .navigationTitle("Tab Views")
    }
}

struct HomeView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
            VStack(spacing: 30) {
                Text("HOME TAB")
                    .font(.largeTitle)
                Text("This is a Tab View. Pressing on the button below changes the selection binding for tabs: it switches to the third tab.")
                Button(action: {
                    selectedTab = 2
                }, label: {
                    Text("Go to profile")
                }).buttonStyle(.borderedProminent).controlSize(.large)
            }
        .padding()
    }
}


struct TabViewPagedStyle: View {
    let icons: [String] = ["heart.fill", "globe", "house.fill", "person.fill"]
    
    var body: some View {
        TabView {
            ForEach(icons, id: \.self) { iconName in
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .navigationTitle("Tab View Carousel")
        .frame(height: 300)
        .background(
        RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 5, endRadius: 350)
        )
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic)) // Change to always, to always display a background and padding around the indices.

    }
}

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        AboutTabViews()
        TabViewPagedStyle()
    }
}
