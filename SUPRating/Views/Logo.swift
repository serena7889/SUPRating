//
//  Logo.swift
//  SUPRating
//
//  Created by Serena Lambert on 12/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct Logo: View {
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("WHAT")
                .fontWeight(.light)
                .font(.system(size: 40))
                .foregroundColor(.white)
            Text("SUP")
                .fontWeight(.light)
                .font(.system(size: 40))
                .foregroundColor(DARK_BLUE)
        }
    .padding(10)
        .frame(maxWidth: .infinity)
//        .background(LIGHT_BLUE)
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
