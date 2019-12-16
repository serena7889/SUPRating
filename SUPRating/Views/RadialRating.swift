//
//  RadialRating.swift
//  SUPRating
//
//  Created by Serena Lambert on 12/12/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import SwiftUI

struct RadialRating: View {

    let value: Int
    let textSize: CGFloat
    let size: CGFloat
    let lineWidth: CGFloat
    

    var body: some View {
        ZStack {
            
            Circle()
                .stroke(lineWidth: lineWidth)
                .foregroundColor(Color.white.opacity(0.3))
            
            Circle()
                .trim(from: 0, to: CGFloat(Double(value) / 100))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: -90.0))
                .animation(.easeIn)
            
            Text("\(value)")
                .font(.system(size: textSize))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
        }.frame(width: size, height: size)
    }

}

struct RadialRating_Previews: PreviewProvider {
    static var previews: some View {
        RadialRating(value: 68, textSize: 20, size: 40, lineWidth: 10)
        .padding()
        .background(DARK_BLUE)
    }
}
