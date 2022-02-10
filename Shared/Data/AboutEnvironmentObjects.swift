//
//  AboutEnvironmentObjects.swift
//  MySwiftUI
//
//  Created by Dino Curic on 30.06.21.
//

import SwiftUI


// MARK: WE'VE HAD: State, StateObject, ObservedObject, and now EnvironmentObject
/*
 EnvironmentObject wrapper is basically the same as ObservedObjects, but we can now put it in the "environment", the background of the whole app, so we can use it in every View.
 
 This is our example scenario: we have three Views. The First has a navigationView and connects subsequently the other two. What if we wanted to have our ViewModel in each three of them?
 
 We could, as we've learned so far with @StateObject and @ObservedObject, pass in each SubViews an @ObservedObject and link it thus with the viewModel. We than pass it through each screen hierarchy.
 
 This isn't ideal. If we want it simpler we can put the ViewModel into the environment starting at the hierarchy level of the first screen. To do this we add the modifier .environmentObject() to the first screen's NavigationView.
 
 Environment Objects should be used sparingly. To many at once and used ineffeciantly can get confusing and slow down your app.
 
 EO come into play when you have a larger view hierachy.
 */

class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        dataArray.append(contentsOf: ["Dino","Belma","Began","Sefika","Konrad"])
    }
    
}


// MARK: - First Screen with @StateObject initial creation
struct AboutEnvironmentObjects: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
        VStack {
            Text("This wrapper is used if you have larger view hierachies. With @StateObjects you would have to pass on the View Model at each level. With Environment Objects you only have to add it to the top level's NavigationView and the Environment Object can be accessed at each subsequent Screen.")
                .padding()
        List {
            ForEach(viewModel.dataArray, id: \.self) { name in
                
                NavigationLink(
                    destination: DetailEnvironmentView(selectedItem: name),
                    label: {
                        Text(name)
                    })
                
            }
        }
        }
        .navigationTitle("@EnvironmentObjects")
        }
        .environmentObject(viewModel)
        
    }
    
    
}

// MARK: - Second Screen with @ObservedObject. On this one we actually don't need the viewModel.
struct DetailEnvironmentView: View {
    
    let selectedItem: String
//    @ObservedObject var viewModel: EnvironmentViewModel
    

// This is not needed, because there is no need for a viewModel in here
//    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: ThirdScreenEnvironment(),
                label: {
                    Text(selectedItem)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.orange)
                        .cornerRadius(10)
                })
            
            
                
            
        }
    }
}

// MARK: - Third Screen with @ObservedObject. On this one we need the viewModel.
struct ThirdScreenEnvironment: View {
    
    // No longer needed, because of @EnvironemntObject
//    @ObservedObject var viewModel: EnvironmentViewModel
    
    // This now means: "there is an EnvironemtViewModel in the environment, look for it and create a viewModel from it. If there is none it will crash!"
    @EnvironmentObject var viewModel: EnvironmentViewModel

    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("Below is the data accessed by @EnvironmentObject from the environment")
                    .padding()
                
                ForEach(viewModel.dataArray, id: \.self) { name in
                    Text(name)
                        .bold()
                        .padding()
                        .font(.title)
                        .foregroundColor(.white)
                        
                }
            }

        }
        
    }
}


struct AboutEnvironmentObjects_Previews: PreviewProvider {
    static var previews: some View {
        
            AboutEnvironmentObjects()
        
    }
}
