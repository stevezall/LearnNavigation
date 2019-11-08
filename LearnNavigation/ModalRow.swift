//
//  ModalRow.swift
//  LearnNavigation
//
//  Created by Steven Stefanik on 10/31/19.
//  Copyright © 2019 Steven Stefanik. All rights reserved.
//

import SwiftUI

struct ModalRow: View {
    
    @State private var isPresenting = false

    let name: String
    
    var body: some View {
        
        Button("Present \(name)") {
            self.isPresenting = true
        }.sheet(isPresented: self.$isPresenting) {
            Text("showing \(self.name)")
        }
    }
}

//struct ModalRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalRow()
//    }
//}
