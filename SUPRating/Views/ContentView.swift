//
//  ContentView.swift
//  SUPRating
//
//  Created by Serena Lambert on 30/11/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView {
                ListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("List View")
                    }
                MapView()
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Map View")
                    }
                
            }
            .navigationBarTitle("SUP Rating")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
