//
//  ListView.swift
//  SUPRating
//
//  Created by Serena Lambert on 02/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    var businesses: [Business]!
    
    var body: some View {
        VStack {
            
            List {
                ForEach(businesses) { business in
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
        ListView(businesses: DataService.instance.getBusinesses())
    }
}
