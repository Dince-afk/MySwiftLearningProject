//
//  StateAndObservableObject.swift
//  MySwiftUI
//
//  Created by Dino Curic on 29.06.21.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let count: Int
}


// What are ObservableObjects?
/*
 To manage data and corresponding functionality we use a class ViewModel. This is a seperate class that stores the data itself and functions related to it: deleting data, loading it or creating it. This class and the views can only "observe" each other and update if necessary if we tell SwiftUI that...
 1): the class ViewModel is an ObservableObject (using the protocoll), meaning the class can if needed be observed by the View/Interface.
 2): in the View itself add the wrapper @ObservedObject, meaning the View will keep an eye on the class and possible changes, in order to update the view, itself, accordingly.
 This is being done to keep the logic and data outside of the view, according to MMVP or however its written.
 */

// View Model Class
class FruitViewModel: ObservableObject {
    
    // @Published?
    /*
     Publishes"/informs/updates the view model if something changes in this property.
     Only changes in published properties get to the class view model which in turn updates the view.
     */
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    // init()?
    /*
     init() is used to run code immediatly after the class instance is finished loading. As soon as we initialize this FruitViewModel() the following code runs:
     */
    init() {
        getFruits()
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Bananas", count: 5)
        let fruit3 = FruitModel(name: "Peaches", count: 12)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitArray.append(contentsOf: [fruit1, fruit2, fruit3])
            self.isLoading = false
        }
    }
}

struct StateAndObservableObject: View {
    //        @State var fruitArray: [FruitModel] = [] // Replaced by FruitViewModel
    
    // MARK: - ABOUT THE WRAPPERS:
    /*
     One downside about @ObservedObject wrapper is that every time the View is reloaded/rebuilt, the viewModel is being rebuilt alongside. So you kind of want the data actually to persist if the View is reloaded.
     So we use @StateObject. It is basically identical to the @ObservedObject wrapper but if the View is reloaded the @StateObject will persist. It will not refresh. Tipp: if it's the first place in your app use @StateObject, if it's the second one use @StateObject.
     */
    
    // USE THIS ON INIT / CREATION:
    @StateObject var fruitViewModel = FruitViewModel()
    
    // IF YOU USE THE CONTROLLER IN YOUR NEXT SUB VIEW USE THIS:
    //    @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    
    var body: some View {
        
        VStack {
            Text("This wrapper is used to access an outside of the screen View Model (conforming to ObservableObject protocol) on your screen. To access the View Model on your initial screen, on first creation basically, use @StateObject. For subviews, down the hierarchy, use @ObservedObject, so as to not recreate the View Model. Use for example this in your subview: @ObservedObject var fruitViewModel : FruitViewModel. This then requires the initial @StateObject to be linked.")
                .padding()
            List {
                
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
                
                
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("@StateObject")
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: SecondView(fruitViewModel: fruitViewModel),
                                        label: {
                                            Image(systemName: "arrow.right")
                                            .font(.title)})
            )
        }
    }
}

// MARK: WHAT IF WE WANTED OUR VIEWMODEL ON THIS SECOND SCREEN?
/*
 If we add the model to a second View we use @ObservedObject, but we don't initialize it like in the first View.
 */

struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        
        
        VStack(spacing: 40) {
            Text("Through @ObservedObject var fruitViewModel: FruitViewModel we are connected to the initial @StateObject var fruitViewModel = FruitViewModel() on the main/first View.")
            ForEach(fruitViewModel.fruitArray) { fruit in
                Text(fruit.name)
                    .font(.headline)
            }
        }
        
    }
}


struct StateAndObservableObject_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StateAndObservableObject()
        }
    }
}
