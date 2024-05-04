//
//  StatBubbleView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/3/24.
//

import SwiftUI

struct StatBubbleView: View {
    
    var title: String
    var stat: String
    var gradientStartColor: Color
    var gradientEndColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(colors: [gradientStartColor, gradientEndColor], startPoint: .topLeading, endPoint: .bottomTrailing))
            VStack {
                Text(title)
                    .font(.captionText)
                Text(stat)
                    .font(.featuredNumber)
                    
            }
            .foregroundColor(.white)
            .bold()
        }
        .frame(width: 60, height: 40)
    }
}

#Preview {
    StatBubbleView(title: "Hours", stat: "200", gradientStartColor: Color("Navy"), gradientEndColor: Color("Blue"))
}
