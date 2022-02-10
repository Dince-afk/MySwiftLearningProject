//
//  SheetsAndFullScreenCovers.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 17.06.21.
//

import SwiftUI

struct AboutSheets: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        
        ZStack {
            Color.orange.ignoresSafeArea()
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .font(.headline)
                    .padding()
                    .background(Color.white.cornerRadius(10))

            })
        }
        .navigationTitle("Sheets")
        // Shows a full screen sheet.
//        .fullScreenCover(isPresented: $showSheet, content: {
//            SecondScreen()
//        })
        // Shows a sheet that's easily dismissable. Only one of both can work.
        .sheet(isPresented: $showSheet, content: {
            SecondScreen()
        })
        
    }
}

struct SecondScreen: View {
    
    // This you just have to memorize, no completion.
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            Color.yellow.ignoresSafeArea()
            
            Button(action: {
                // Also just have to remember.
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
            })
        }
    }
}


// MARK: - FOREACH AND MULTIPLE SHEETS
// MARK: Explanation
/*
 1. There are common pitfalls when dealing with more advanced sheet needs. The first is that there sheets can only appear on one single level of a view hierarchy. There cannot be a sheet modifier attached at both ScrollView and on inside the VStack. No parent, child sheets each. The second one is that because the view inside the sheet is already constructed when the rest of the view is build, you can't change values inside the sheet view from the parent view.
 2. Changing the values used inside the sheet view can be achieved in three ways. 1: binding the value in the sheet view to a property in the parent view. 2: use multiple sheets that each pre create the value needed inside the .sheet modifier (can be very tidious). 3: use $item like in the code below.
 */

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheets: View {
    @State var selectedRandomModel: RandomModel? = nil
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<20) { index in
                    Button("Press Button \(index)") {
                        selectedRandomModel = RandomModel(title: "\(index)")
                    }
                }
            }
        }
        .navigationTitle("Multiple Sheets")
        .sheet(item: $selectedRandomModel) { model in
            SheetScreen(randomModel: model)
        }
    }
}


struct SheetScreen: View {
    let randomModel: RandomModel
    var body: some View {
        Text(randomModel.title)
            .font(.title)
    }
}


struct SheetsAndFullScreenCovers_Previews: PreviewProvider {
    static var previews: some View {
        AboutSheets()
        MultipleSheets()
    }
}
