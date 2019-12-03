//
//  BusinessRow.swift
//  SUPRating
//
//  Created by Serena Lambert on 03/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct BusinessRow: View {
    
    var business: Business!
    
    var body: some View {
        HStack {
            Text(business.title)
                .fontWeight(.semibold)
            Spacer()
            Text(String(format: "%.1f", arguments: [business.rating]))
                .foregroundColor(DataService.instance.getColor(forRating: business.rating))
        }
    }
}

struct BusinessRow_Previews: PreviewProvider {
    static var previews: some View {
        BusinessRow()
    }
}
