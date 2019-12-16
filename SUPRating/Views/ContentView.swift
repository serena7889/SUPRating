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
    @State var typeSelected = BusinessType.any
    let viewName = ["List", "Map"]
//    let categories = ["Any", "Supermarket", "Coffee shop", "Restaurant"]
    
    let edgeInsets = EdgeInsets(top: 50, leading: 10, bottom: 0, trailing: 10)
    let bottomInsets = EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
    
    init() {
        UISegmentedControl.appearance().backgroundColor = UIColor.white
        UISegmentedControl.appearance().selectedSegmentTintColor = DARK_BLUE_UI
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: DARK_BLUE_UI], for: .normal)
    }
    
    var body: some View {
        VStack {

            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .padding(bottomInsets)
            
            Picker(selection: $typeSelected, label: Text("Category:")) {
                Text("Any").tag(BusinessType.any)
                ForEach(1..<DataService.instance.getTypes().count) {
                    DataService.instance.getIcon(forBusinessType: DataService.instance.getTypes()[$0]).tag(DataService.instance.getTypes()[$0])
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Picker(selection: $minRating, label: Text("Filter by rating")) {
                Text("Any").tag(0)
                Text("> 20%").tag(20)
                Text("> 40%").tag(40)
                Text("> 60%").tag(60)
                Text("> 80%").tag(80)
            }
                .pickerStyle(SegmentedPickerStyle())
                .padding(bottomInsets)

            Picker(selection: $viewSelected, label: Text("View as:")) {
                ForEach(0..<viewName.count) {
                    Text(self.viewName[$0]).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(bottomInsets)

            if viewSelected == 0 {
                ListView(businesses: DataService.instance.filterBusinesses(byTerm: term, andRating: minRating, andBusinessType: typeSelected))
            } else {
                Map(businesses: DataService.instance.filterBusinesses(byTerm: term, andRating: minRating, andBusinessType: typeSelected), businessDetail: false)
            }
            Spacer()
        }
            .padding(edgeInsets)
            .edgesIgnoringSafeArea(.all)
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
