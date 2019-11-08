//
//  ContentView.swift
//  LearnNavigation
//
//  Created by Steven Stefanik on 10/17/19.
//  Copyright © 2019 Steven Stefanik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // found this website very helpful
    // https://goshdarnswiftui.com/
    
    //    var details = [["id": 1, "name": "detail 1"], ["id": 2, "name": "detail 2"]]
    var details = ["detail 1", "detail 2", "detail 3", "detail 4"]
    var modals = ["modal 1", "modal 2", "modal 3"]
    var alerts = ["alert 1", "alert 2"] // how could i dynamically define the alert type
    
    struct CustomAlert: Identifiable {
        let id: Int
        let name: String
        let alertType: String
    }
    
    var alerts2 = [
        CustomAlert(id: 1, name: "alert 1", alertType: "alert"),
        CustomAlert(id: 2, name: "alert 2", alertType: "actionSheet")
    ]
    
    @State var showAlert: Bool = false
    @State var showModal: Bool = false
    @State private var alertItem: CustomAlert? = nil
    @State private var actionSheetItem: CustomAlert? = nil
    
    var body: some View {
        
        NavigationView {
            List {
                Section() {
                    // https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach
                    ForEach(details, id: \.self) { detail in
                        NavigationLink(destination: DetailView()) {
                            // because this is the only way to get chevron, can't use chevrons to present modals or show alert views
                            Text("Push to \(detail)")
                        }
                    }
                }
                
                Section(header: Text("error: already presenting")) {
                    ForEach(modals, id: \.self) { modal in
                        Button("Present \(modal)") {
                            self.showModal = true
                        }.sheet(isPresented: self.$showModal) {
                            Text("showing a modal")
                        }
                    }
                }
                
                
                
                // modal with separate view and state for each row
                Section(header: Text("The right way")) {
                    ForEach(modals, id: \.self) { modal in
                        ModalRow(name: modal)
                    }
                }
                
                Section(header: Text("error: already presenting")) {
                    ForEach(alerts, id: \.self) { alert in
                        Button("Tap me \(alert)") {
                            print("present \(alert)")
                            self.showAlert = true
                        }.alert(isPresented: self.$showAlert) { () -> Alert in
                            Alert(title: Text("Alert!"), message: Text("You tapped \(alert)"), primaryButton: .default(Text("Sounds good")), secondaryButton: .destructive(Text("DELETE"), action: {
                                // delete action
                            }))
                            // magically resets state variable on dismiss
                        }
                    }
                }
                
                Section(header: Text("a different way, but right?")) {
                    // https://mecid.github.io/2019/07/24/alerts-actionsheets-modals-and-popovers-in-swiftui/
                    ForEach(alerts2) { alert in
                        Button("Tap me \(alert.name)") {
                            print("present \(alert.name)")
                            if alert.alertType == "alert" {
                                self.alertItem = alert
                            }
                            if alert.alertType == "actionSheet" {
                                self.actionSheetItem = alert
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Navigation Tests")
                // https://stackoverflow.com/questions/57945907/rounded-corners-in-swiftui-list-sections
                // cant do insetGrouped in SwiftUI yet
                .listStyle(GroupedListStyle())
            
        }
        .alert(item: self.$alertItem) { (item) in
            Alert(title: Text(item.name))
        }
        .actionSheet(item: self.$actionSheetItem) { (item) in
            ActionSheet(title: Text(item.name))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
