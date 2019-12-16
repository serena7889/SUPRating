//
//  BusinessRow.swift
//  SUPRating
//
//  Created by Serena Lambert on 03/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct BusinessRow: View {
    
    var business: Business
    
    var body: some View {
        HStack {
            Text(business.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
            Spacer()
            RadialRating(value: business.ratings[0], textSize: CGFloat(20), size: CGFloat(40), lineWidth: CGFloat(5))
        }
        .padding(10)
        .background(DARK_BLUE)
        .cornerRadius(20)
        .clipped()
    }
}

struct BusinessRow_Previews: PreviewProvider {
    static var previews: some View {
        BusinessRow(business: DataService.instance.getBusinesses()[0])
    }
}
