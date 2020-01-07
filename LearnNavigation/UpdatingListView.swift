//
//  UpdatingListView.swift
//  LearnNavigation
//
//  Created by Steven Stefanik on 12/13/19.
//  Copyright © 2019 Steven Stefanik. All rights reserved.
//

import SwiftUI

class ListDataStore: ObservableObject {
    var pretendDatabase = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
    var number = 1 {
        didSet {
            objectWillChange.send()
        }
    }
    
    init() {
        
    }
}

class UpdatingListViewModel: ObservableObject {
    @Published var items = ["Item 1", "Item 2", "Item 3", "Item 4"]
    @ObservedObject var numberObject = ListDataStore()
}

struct UpdatingListView: View {
//    @State var items = ["Item 1", "Item 2", "Item 3", "Item 4"]
    @State var number = 3
    @ObservedObject var viewModel = UpdatingListViewModel()
    var body: some View {
        Group {
            HStack {
                Button(action: {
                    self.viewModel.items.append("New Item")
                }) {
                    Text("Add Row")
                }
                .padding()
                Spacer()
                Button(action: {
                    self.viewModel.items.removeLast()
                }) {
                    Text("Remove Row")
                }
                .padding()
            }
            List {
                HStack {
                    Text("calcualted number")
                    Spacer()
                    Text("\(viewModel.numberObject.number)")
                }
                
                ForEach(viewModel.items, id: \.self) { item in
                    Text("\(item)")
                }
            }
            .animation(.default)
            
        }
    }
}

struct UpdatingListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatingListView()
    }
}
