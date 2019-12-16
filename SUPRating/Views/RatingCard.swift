//
//  RatingCard.swift
//  SUPRating
//
//  Created by Serena Lambert on 03/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct RatingCard: View {
    
    let title: String
    let score: Int
    
    var body: some View {
        VStack {
            RadialRating(value: score, textSize: CGFloat(50), size: CGFloat(100), lineWidth: CGFloat(10))
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }.padding()
    }
}

struct RatingCard_Previews: PreviewProvider {
    static var previews: some View {
        RatingCard(title: "Overall", score: 67).background(DARK_BLUE)
    }
}
