//
//  Transitions.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 17.06.21.
//

//  Animations are used for views that are already on your screen. Transitions for views that are appearing or for segues to different views.

import SwiftUI

struct AboutTransitions: View {
    @State var showView: Bool = false
    @State var tabSelected: String = "1"
    
    var body: some View {
        TabView(selection: $tabSelected) {
            // MARK: - FIRST TAB:
            VStack {
                Spacer()
                if showView {
                    RoundedRectangle(cornerRadius: 30)
                        .overlay(Text(".transition(.slide)").foregroundColor(.blue))
                        .frame(width: 200, height: 200)
                        .transition(.slide) // Use transition in case of creating the object. Slide in from left and leave to right.
                        .animation(.easeIn)
                }
                if showView {
                    RoundedRectangle(cornerRadius: 30)
                        .overlay(Text(".transition(.move())").foregroundColor(.blue))
                        .frame(width: 200, height: 200)
                        .transition(.move(edge: .trailing)) // Slide in from top.
                        .animation(.easeInOut)
                }
                // For showing object/changing its opacity.
                RoundedRectangle(cornerRadius: 30)
                    .overlay(Text("no transition: just opacity").foregroundColor(.blue))
                    .frame(width: 200, height: 200)
                    .opacity(showView ? 1.0 : 0.0)
                    .animation(.easeInOut, value: showView) // Use animations in that case.
                Spacer(minLength: 200)
            }
            .tag("1")
            // MARK: - SECOND TAB: Very common way of displaying a pop up view to enter something or view info.
            VStack {
                Spacer()
                
                if showView {
                    RoundedRectangle(cornerRadius: 30.0)
                        .overlay(Text(".transition(.move())").foregroundColor(.blue))
                        .frame(height: UIScreen.main.bounds.height * 0.7)
                        .transition(.move(edge: .bottom))
                        .animation(.spring())
                }
                
            }
            
            .tag("2")
            
            // MARK: - THIRD TAB: Also very cool variation.
            VStack {
                Spacer()
                if showView {
                    RoundedRectangle(cornerRadius: 30.0)
                        .frame(height: UIScreen.main.bounds.height * 0.7)
                        .overlay(Text(".transition(.asymmetric())").foregroundColor(.blue))

                        // This one.
                        //                    .transition(AnyTransition.scale.animation(.easeInOut))
                        // Or this one.
                        //                    .transition(AnyTransition.opacity.animation(.easeInOut))
                        // Or this one to get in in from one side and leave a custom one.
                        .transition(.asymmetric(
                                        insertion: .move(edge: .leading),
                                        removal: .move(edge: .bottom)))
                        .animation(.easeInOut)
                    
                }
            }
            .tag("3")
            
        }
        .ignoresSafeArea()
        .navigationTitle("Transitions: \(tabSelected)")
        //        .navigationBarTitleDisplayMode(.inline)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Spacer()
                Button(action: {
                    showView.toggle()
                }, label: {
                    Label("Button", systemImage: showView ? "chevron.down" : "chevron.up")
                })
                Spacer()
            }
        }
        
    }
}

struct Transitions_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutTransitions()
            
        }
    }
}
