//
//  AboutMenus.swift
//  MySwiftUI
//
//  Created by Dino Curic on 31.10.21.
//

import SwiftUI

// A control for presenting a menu of actions.

struct AboutMenus: View {
    var body: some View {
        Menu("Menu") {
            Button("Option 1") {
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .padding()
    }
}

// MARK: - Example Menu Within Menus
struct ExampleMenu: View {
    var body: some View {
        Menu("Actions") {
            Button("Duplicate") {}
            Button("Rename") {}
            Button("Delete…") {}
            Menu("Copy") {
                Button("Copy") {}
                Button("Copy Formatted") {}
                Button("Copy Library Path") {}
            }
        }
    }
}

struct AboutMenus_Previews: PreviewProvider {
    static var previews: some View {
        AboutMenus()
        ExampleMenu()
    }
}
