//
//  AboutActionSheets.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 19.06.21.
//

import SwiftUI

struct AboutActionSheets: View {
    
    @State var tabSelected: Int = 0
    @State private var showSheet = false
    @State var showingOptions: Bool = false
    @State var actionOption: ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        
        TabView(selection: $tabSelected) {
            
            // MARK: 1. Tab
            VStack {
            Button("Show Action Sheet") {
                showSheet = true
            }.buttonStyle(.borderedProminent).controlSize(.large)
            
            Text("Press the button to prompt the Action Sheet.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .actionSheet(isPresented: $showSheet) {
                ActionSheet(title: Text("Title"),
                            message: Text("This is an action sheet"),
                            buttons: [
                                .default(Text("OK"), action: {
                                    
                                }),
                                .destructive(Text("Delete"), action: {
                                    
                                }),
                                .cancel(Text("Cancel"))
                            ])
            }
            .tag(0)
            
            // MARK: 2. Tab
            VStack {
                HStack {
                    Image(systemName: "person.fill")
                        .frame(width: 30, height: 30)
                        .background(Circle().stroke(lineWidth: 1.0))
                    Text("Username")
                    Spacer()
                    Button(action: {
                        actionOption = .isMyPost
                        showingOptions.toggle()
                    }, label: {
                        Image(systemName: "ellipsis")
                    })
                    
                }
                .padding(.horizontal)
                
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                
            }
            .tag(1)
            .actionSheet(isPresented: $showingOptions, content: {getActionSheet()})
            
        }
        .navigationTitle("Action Sheets")
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
    
    func getActionSheet() -> ActionSheet {
        
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            
        }
        
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
            
        }
        
        let deleteButton: ActionSheet.Button = .destructive(Text("Report")) {
            
        }
        
        let cancelButton: ActionSheet.Button = .cancel(Text("Cancel"))

        let title: String = "What would you like to do?"

        switch actionOption {
        case .isOtherPost:
            return ActionSheet(title: Text(title), message: nil, buttons: [shareButton,reportButton,cancelButton])
        case .isMyPost:
            return ActionSheet(title: Text(title), message: nil, buttons: [shareButton,reportButton,deleteButton,cancelButton])
        }
        
        
//        let button1: ActionSheet.Button = .default(Text("Default"))
//        let button2: ActionSheet.Button = .destructive(Text("Destructive"))
//        let button3: ActionSheet.Button = .cancel(Text("Cancel"))
//
//        return ActionSheet(
//            title: Text("This is the title"),
//            message: Text("These are options you can choose."),
//            buttons: [button1,button1,button2,button3])
        
    }
    
}

struct AboutActionSheets_Previews: PreviewProvider {
    static var previews: some View {
        AboutActionSheets()
    }
}
