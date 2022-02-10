//
//  TextFields.swift
//  Scrumdinger
//
//  Created by Dino Curic on 13.06.21.
//

import SwiftUI

struct AboutTextFields: View {
    
    @State var text = ""
    @State var dataArray: [String] = []
    
    var body: some View {

        VStack(spacing: 20) {
            TextField("Type text", text: $text)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            
            
            Button(action: {
                save()
            }, label: {
                Text("Save")
                    .font(.headline)
                    .frame(width: .infinity, height: 55)
                    .frame(maxWidth: 400)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .disabled(!textIsAppropriate())

            
            ForEach(dataArray, id: \.self) { index in
                Text(index)
                    .padding()
            }
            Spacer()
        }
        .padding()
        .navigationTitle("TextFields")
    }
    
    func save() {
        dataArray.append(text)
        text = ""
    }
    func textIsAppropriate() -> Bool {
        if text.count >= 1 {
            return true
        } else {
            return false
        }
        

    }
    
}

struct AboutTextFields_Previews: PreviewProvider {
    static var previews: some View {
        AboutTextFields()
    }
}
