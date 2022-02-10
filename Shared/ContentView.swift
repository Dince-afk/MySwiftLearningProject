//
//  ContentView.swift
//  Shared
//
//  Created by Dino Curic on 26.06.21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            List {
                // MARK: - Quick Lessons
                NavigationLink("Short Lessons", destination: QuickLessons())
                
                // MARK: - User Input
                Section(header: Text("User Input")) {
                    Group {
                        NavigationLink { AboutButtons() } label: { Label("Buttons", systemImage: "rectangle")}
                        NavigationLink("Tap Gestures", destination: AboutTapGestures())
                        NavigationLink("Text Fields", destination: AboutTextFields())
                        NavigationLink("Pickers", destination: AboutPickers())
                        NavigationLink("Sliders", destination: AboutSliders())
                        NavigationLink("Toggles", destination: AboutToggles())
                        NavigationLink("Steppers", destination: AboutSteppers())
                        NavigationLink("Action Sheet", destination: AboutActionSheets())
                    }
                    Group {
                        

                        NavigationLink("Alerts", destination: AboutAlerts())
                        NavigationLink("Color Pickers", destination: AboutColorPickers())
                        NavigationLink("Date Pickers", destination:
                                        List {
                            NavigationLink("About Date Pickers") {
                                AboutDatePickers()
                            }
                            NavigationLink("Example 1") {
                                ExampleDatePickerWakeUp()
                            }
                            NavigationLink("Example 1") {
                                AboutDateFormatting()
                            }
                        })

                        NavigationLink("Magnification Gestures", destination: AboutMagnificationGestures())
                        NavigationLink("Rotation Gestures", destination: AboutRotationGestures())
                        NavigationLink("Drag Gestures", destination: AboutDragGestures())
                    }
                }
                
                // MARK: - Container Views
                Section(header: Text("Container Views")) {
                    NavigationLink("Navigation View", destination: AboutNavigationViews())
                    NavigationLink("Tab Views", destination: AboutTabViews())
                    NavigationLink("Tab View Carousel", destination: TabViewPagedStyle())
                    NavigationLink("Lists", destination: AboutLists())
                    NavigationLink("Grids", destination:
                                    List {
                        NavigationLink("About Grids") {
                            AboutGrids()
                        }
                        NavigationLink("Example 1") {
                            ExampleLazyVGrid()
                        }
                    })
                    NavigationLink("Scroll View Reader", destination: AboutScrollViewReaders())
                    NavigationLink("OnAppear and LazyVStack", destination: AboutOnAppearAndDisappear())
                    NavigationLink("Scroll View Reader", destination: AboutScrollViewReaders())
                    NavigationLink("Sheets", destination: AboutSheets())
                    NavigationLink("Multiple Sheets", destination: MultipleSheets())
                    
                }
                
                // MARK: - Design and Animation
                Section(header: Text("Design and Animation")) {
                    NavigationLink("Graphical Modifiers", destination: AboutGraphicalModifiers())
                    NavigationLink("Dark Mode", destination: AboutDarkMode())
                    NavigationLink("Basic Animations", destination:
                                    List {
                        NavigationLink("Animation Timing") {
                            AnimationTiming()
                        }
                        NavigationLink("Example 1") {
                            ExampleBasicAnimation()
                        }
                        NavigationLink("Example 2: Pulsating Red Border") {
                            ExamplePulsatingRedCircleAnimation()
                        }
                        NavigationLink("Example 3: Rotation") {
                            ExampleRotationEffect()
                        }
                        NavigationLink("Example 4: Dies") {
                            DieGame()
                        }

                    })
                    NavigationLink("Transitions", destination: AboutTransitions())
                    NavigationLink("Mask Modifier", destination: Masks())
                    NavigationLink("Recipe Design", destination: ExampleRecipesApp())
                    NavigationLink("Example: Complex Scroll View", destination: ComplexScrollView())
                }
                
                // MARK: - Data
                Section(header: Text("Data")) {
                    NavigationLink("Data Models", destination: AboutModels())
                    NavigationLink("if let and guard let", destination: GuardsAndIfLets())
                    NavigationLink("@StateObject and @ObservedObject", destination: StateAndObservableObject())
                    NavigationLink("@EnvironmentObject", destination: AboutEnvironmentObjects())
                    NavigationLink("@AppStorage", destination: AppStorageLessons())
                }
                
                // MARK: - Audio
                Section(header: Text("Audio")) {
                    NavigationLink("Playing Sounds", destination: PlaySounds())
                }
                
                // MARK: - Real-life Examples
                Section(header: Text("Real-life Examples")) {
                    NavigationLink("Onboarding", destination: IntroView())
                    NavigationLink("Drag Login Screen Updward", destination: DragLogInScreenUpward())
                }
            }
            .navigationTitle("My Lessons")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
