//
//  Alerts.swift
//  Scrumdinger (iOS)
//
//  Created by Dino Curic on 19.06.21.
//

import SwiftUI

struct AboutAlerts: View {
    
    @State var alertType: myAlerts? = nil
    @State var showAlert: Bool = false
    
    enum myAlerts {
        case success
        case error
    }
    
    var body: some View {
        GroupBox("Alerts") {
            VStack(spacing: 40) {
                Text("Tap either button to show an alert.")
                    .font(.footnote)
                HStack {
                    Button("Success") {
                        alertType = .success // 1. 
                        showAlert.toggle()
                    }
                    Button("Error", role: .destructive) {
                        alertType = .error
                        showAlert.toggle()
                    }
                }
                .buttonStyle(.bordered).controlSize(.large)
            }
            .alert(isPresented: $showAlert, content: {
                getAlert()
            })
        }
    }
    
    // MARK: Don't know why we need a function. It does return an error without it.
    func getAlert() -> Alert {
        switch alertType {
        case .error:
            return Alert(
                title: Text("Error"),
                message: Text("The video could not be uploaded."),
                dismissButton: .default(Text("Dismiss")))
        case .success:
            return Alert(
                title: Text("Success"),
                message: Text("The video was successfully uploaded."))
        default:
            return Alert(title: Text("Error"))
        }
    }
}

struct AlertsPlayground: View {
    @State var alertType: myAlerts? = nil
    @State var showAlert: Bool = false
    
    enum myAlerts {
        case success
        case error
    }
    
    var body: some View {
        Text("")
    }
}


struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        AboutAlerts()
        AlertsPlayground()
    }
}
