//
//  ListView.swift
//  SUPRating
//
//  Created by Serena Lambert on 02/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @State private var term = ""
    @State private var ratingIndex = 0
    
    let ratingFilterTitle = ["Any", "1+", "2+", "3+", "4+"]
    
    var body: some View {
        VStack {
            TextField("Search", text: $term)
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
            Picker(selection: $ratingIndex, label: Text("Filter by rating")) {
                ForEach(0..<ratingFilterTitle.count) {
                    Text(self.ratingFilterTitle[$0]).tag($0)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
            List {
                ForEach(DataService.instance.filterBusinesses(byTerm: term, andRating: ratingIndex)) { business in
                    NavigationLink(destination: BusinessDetailView(business: business)) {
                        BusinessRow(business: business)
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
