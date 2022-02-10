//
//  AboutLists.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 17.06.21.
//

import SwiftUI

struct AboutLists: View {
    
    @State var fruits: [String] = ["apple","orange","banana","peach"]
    @State var veggies: [String] = ["brocoli", "potatoes","paprika","cabbage"]
    
    
    
    var body: some View {
        
        
        List {
            Section(header: HStack {
                Text("Fruits")
                Image(systemName: "flame") // This also works.
            }) {
                ForEach(fruits, id: \.self) { fruit in
                    
                    Text(fruit.capitalized)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            
            Section(header: Text("Veggies")) {
                ForEach(veggies, id: \.self) { veg in
                    Text(veg.capitalized)
                        .padding(.vertical)
                }
                .listRowBackground(Color("customColor"))
            }
        }
        .accentColor(.purple) // Color the Sections.
        //            .listStyle(GroupedListStyle()) // List styles might look very different on different devices.
        .navigationTitle("Lists")
        .navigationBarItems(
            leading: EditButton(),
            trailing: addButton)
        .accentColor(.red) // Color the whole NavigationView.
        
        
    }
    
    
    var addButton: some View {
        Button("Add", action: {
            add()
        })
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(fromOffsets: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: fromOffsets, toOffset: newOffset)
    }
    
    func add() {
        fruits.append("Coconut")
    }
    
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AboutLists()
        }
    }
}
