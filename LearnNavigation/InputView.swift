//
//  InputView.swift
//  LearnNavigation
//
//  Created by Steven Stefanik on 12/3/19.
//  Copyright © 2019 Steven Stefanik. All rights reserved.
//

import SwiftUI

struct InputView: View {
    @State var name = ""
    @State var picker = ""
    @State var date = Date()
    var body: some View {
        
        Form {
            Section {
                Text("Other Info")
                Text("Other Info")
                Text("Other Info")
                TextField("Name", text: $name)
                Text("Other Info")
                DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                    Text("Select a date")
                }
            }
            Section {
                Text("Other Info")
                Text("Other Info")
                Text("Other Info")
                TextField("Name", text: $name)
                Text("Other Info")
            }
            Section {
                Text("Your information")
                TextField("Name", text: $name)
            }
        }
        .keyboardAwarePadding()
        .gesture(DragGesture().onChanged({ _ in
            print("drag")
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }))
    }
    
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
