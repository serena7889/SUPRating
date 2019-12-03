//
//  RatingCard.swift
//  SUPRating
//
//  Created by Serena Lambert on 03/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct RatingCard: View {
    
    let title: String!
    let score: Int!
    
    var body: some View {
        VStack {
            Text("\(score)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(DataService.instance.getColor(forRating: score))
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(DataService.instance.getColor(forRating: score))
        }
        .frame(width: 150)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(DataService.instance.getColor(forRating: score), lineWidth: 5)
        )
    }
}

struct RatingCard_Previews: PreviewProvider {
    static var previews: some View {
        RatingCard(title: "Overall", score: 67)
    }
}
