//
//  ListView.swift
//  SUPRating
//
//  Created by Serena Lambert on 02/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedBusiness = DataService.instance.getBusinesses()[0]
    @State private var showDetail = false
    
    var businesses: [Business]!
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(businesses) { business in
                    Button(action: {
                        self.selectedBusiness = business
                        self.showDetail = true
                        }) {
                        BusinessRow(business: business)
                    }
                }
            }
        }.sheet(isPresented: $showDetail) {
            BusinessDetailView(business: self.selectedBusiness)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(businesses: DataService.instance.getBusinesses())
    }
}
