//
//  Grids.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 13.06.21.
//

import SwiftUI

struct AboutGrids: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
        
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 6,
                      pinnedViews: [.sectionHeaders],
                      content: {
                        Section(header:
                                    Text("Section")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.blue)
                                
                        ) {
                            ForEach(0..<50) { index in
                                Rectangle()
                                    .frame(height: 150)
                            }
                        }
                        
                        
                      })
            
            
        }
        .navigationTitle("ScrollView and LazyVGrid")
    }
}

struct ExampleLazyVGrid: View {
    let items = 1...50
    
    static let size = 170.0
    
    let columns = [
        GridItem(.fixed(size), spacing: 20),
        GridItem(.fixed(size), spacing: 20)
    ]
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(items, id: \.self) { item in
                        Image(systemName: "\(item).circle.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 120))
                            .frame(width: ExampleLazyVGrid.size, height: ExampleLazyVGrid.size)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.cyan))
                    }
                }
            }
            .navigationTitle("LazyVGrid Example")
    }
}


struct Grids_Previews: PreviewProvider {
    static var previews: some View {
        AboutGrids()
        ExampleLazyVGrid()
    }
}
