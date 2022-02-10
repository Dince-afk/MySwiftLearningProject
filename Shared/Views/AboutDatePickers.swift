//
//  AboutDatePickers.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 27.06.21.
//

import SwiftUI

struct AboutDatePickers: View {
    
    @State var selectedDate: Date = Date() // returns todays date.
    @State var startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date() // in case this doesn't exist choose todays date.
    @State var endingDate = Date()
    
    // We need to create a date formatter. It seems to be a machine that inputs a date and returns the desired format. To specify the desired format we create a custom formatter with a computed variable.
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text(dateFormatter.string(from:selectedDate))
                    .font(.title2)
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .offset(y: 30)
                Spacer()
            }
            TabView {
                VStack {
                    Text("Compact Date Picker Style (Default)")
                        .font(.title3)
                    Divider()
                    DatePicker("Select a date", selection: $selectedDate)
                        .datePickerStyle(CompactDatePickerStyle()) // Default
                }
                VStack {
                    Text("Graphical Date Picker Style")
                        .font(.title3)
                    Divider()
                    DatePicker("Select a date", selection: $selectedDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                VStack {
                    Text("Closed range for selection")
                        .font(.title3)
                    Divider()
                    DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate)
                }
                VStack {
                    Text("Wheel Date Picker Style")
                        .font(.title3)
                    Divider()
                    DatePicker("Select a date", selection: $selectedDate)
                        .datePickerStyle(WheelDatePickerStyle())
                }
                VStack {
                    Text("Wheel Date Picker Style: showing only years")
                        .font(.title3)
                    Divider()
                    DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date])
                        .datePickerStyle(WheelDatePickerStyle())
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .navigationBarTitle("Date Pickers")
        .padding()
    }
}

struct ExampleDatePickerWakeUp: View {
    @State var date = Date.now
    
    var body: some View {
        ScrollView {
            GroupBox {
                DatePicker("Pick a date", selection: $date)
                    .padding()
            } label: {
                Label("Basic Date Picker", systemImage: "sunrise.fill")
            }
            GroupBox {
                DatePicker("Pick a date", selection: $date)
                    .padding()
                    .labelsHidden() // Show only the date picker
            } label: {
                Label("Picker without a label", systemImage: "sunrise.fill")
            }
            GroupBox {
                DatePicker("Pick a date", selection: $date, displayedComponents: .date) // Show only the date
                    .padding()
                    .labelsHidden() // Show only the date picker
            } label: {
                Label("Picker showing only date", systemImage: "sunrise.fill")
            }
            GroupBox {
                DatePicker("Pick a date", selection: $date, in: Date.now... , displayedComponents: .date) // Show only the date
                    .padding()
                    .labelsHidden() // Show only the date picker
            } label: {
                Label("Picker allowing only specific date range: from Today to open future", systemImage: "sunrise.fill")
            }
        }
        .navigationTitle("Example Wake Up Alarm")

    }
}


struct AboutDateFormatting: View {
    var body: some View {
        VStack(spacing: 40) {
            // Use the format parameter of Text View to select what date components are to be displayed. How does it work with global time differences in format? It automatically displays the date components in the regional  format. Germany: day, month, year, UK: month, day, year etc.
            Text(Date.now, format: .dateTime.day().month())
            // Alternatively use the formatted() method and enums like .long and .short
            Text(Date.now.formatted(date: .abbreviated, time: .omitted))
        }
        .navigationTitle("About Date Formatting")
    }
}

struct DatePickers_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutDatePickers()
        }
        ExampleDatePickerWakeUp()
        AboutDateFormatting()
    }
}
