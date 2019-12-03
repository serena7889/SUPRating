//
//  BusinessDetailView.swift
//  SUPRating
//
//  Created by Serena Lambert on 03/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct BusinessDetailView: View {
    
    let business: Business!
    
    var body: some View {
        VStack {
            MapView(business: business)
                .frame(height: 300)
            Text(business.title).font(.title)
            Text(business.subtitle)
            Text(String(format: "%.2f", arguments: [business.rating]))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(DataService.instance.getColor(forRating: business.rating))
            Spacer()
        }
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView(business: DataService.instance.getBusinesses()[1])
    }
}
