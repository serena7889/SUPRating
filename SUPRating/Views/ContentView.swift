//
//  ContentView.swift
//  SUPRating
//
//  Created by Serena Lambert on 30/11/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var term = ""
    @State private var minRating = 0
    @State var viewSelected = 0
    let viewName = ["List", "Map"]
    let ratingFilterTitle = ["Any", "1+", "2+", "3+", "4+"]
    
    let edgeInsets = EdgeInsets(top: 5, leading: 12, bottom: 5, trailing: 12)
    
    var body: some View {
        NavigationView {
            VStack {

                TextField("Search", text: $term)
                    .padding(edgeInsets)

                Picker(selection: $minRating, label: Text("Filter by rating")) {
                    Text("Any").tag(0)
                    Text("> 20%").tag(20)
                    Text("> 40%").tag(40)
                    Text("> 60%").tag(60)
                    Text("> 80%").tag(80)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(edgeInsets)

                Picker(selection: $viewSelected, label: Text("View as:")) {
                    ForEach(0..<viewName.count) {
                        Text(self.viewName[$0]).tag($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(edgeInsets)

                if viewSelected == 0 {
                    ListView(businesses: DataService.instance.filterBusinesses(byTerm: term, andRating: minRating))
                } else {
                    MapView(businesses: DataService.instance.filterBusinesses(byTerm: term, andRating: minRating), businessDetail: false)
                }
            }
            .navigationBarTitle("whatSUP")
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
