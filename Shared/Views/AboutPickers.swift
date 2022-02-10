//
//  AboutPickers.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 26.06.21.
//

import SwiftUI

struct AboutPickers: View {
    @State var pick: Int = 1
    @State var pick2: Int = 1
    @State var pick3: Int = 1

    
    var body: some View {
        ScrollView {
            GroupBox("Menu Picker (Default)") {
                Picker("Pick value", selection: $pick) {
                    ForEach(1...5, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            
            GroupBox("Segmented Picker") {
                Picker("Pick value", selection: $pick2) {
                    ForEach(1...4, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
                .pickerStyle(.segmented)
                
                GroupBox("Wheel Picker") {
                    Picker("Pick value", selection: $pick3) {
                        ForEach(1...30, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                .pickerStyle(.wheel)

            }
            .navigationBarTitle("Pickers")
        }
        
    }
    
    
    struct AboutPickers_Previews: PreviewProvider {
        
        static var previews: some View {
            AboutPickers()
        }
    }
