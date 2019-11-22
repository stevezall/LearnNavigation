//
//  OrganizeView.swift
//  LearnNavigation
//
//  Created by Steven Stefanik on 11/20/19.
//  Copyright © 2019 Steven Stefanik. All rights reserved.
//

import SwiftUI

struct OrganizeView: View {
    @State var isShowing = false
    
    // as computed properties
    // https://swiftwithmajid.com/2019/10/30/view-composition-in-swiftui/
    // cant send any parameters
    var row2: some View {
        Text("Row 2 as computed property")
    }
    
    var body: some View {
            List {
                Section {
                    VStack {
                        Toggle("Row 1", isOn: $isShowing)
                        
                        if isShowing {
                            Text("Hello World!")
                        }
                    }
                    Text("Row 2")
                    Text("Row 3")
                    Text("Row 4")
                }
                Section {
                    OrganizeViewSwitchRow()
                    row2
                    Row3()
                    Row4()
                }
            }
            .navigationBarTitle("Organize")
            .listStyle(GroupedListStyle())
    }
    
    struct Row3: View {
        var body: some View {
            HStack {
                Text("Row 3 nested struct")
                Spacer()
                MyIcon()
            }
        }
        
        struct MyIcon: View {
            var body: some View {
                Image(systemName: "flame")
                    .foregroundColor(Color.orange)
            }
        }
    }
}

// new structs, end up with long names
struct OrganizeViewSwitchRow: View {
    @State var isShowing = false
    var body: some View {
        VStack {
            Toggle("Row 1 struct", isOn: $isShowing)
            
            if isShowing {
                Text("Hello World!")
            }
        }
    }
}



extension OrganizeView {
    struct Row4: View {
        var body: some View {
            HStack {
                Text("Row 4 extension")
                Spacer()
                MyIcon()
            }
        }
        
        
    }
}

extension OrganizeView.Row4 {
    struct MyIcon: View {
        var body: some View {
            Image(systemName: "bolt.fill")
                .foregroundColor(Color.red)
        }
    }
}


struct OrganizeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        OrganizeView()
        }
    }
}


struct Row4View_Previews: PreviewProvider {
    static var previews: some View {
        OrganizeView.Row4()
            .previewLayout(PreviewLayout.fixed(width: 300, height: 44))
    }
}
