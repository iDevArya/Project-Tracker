//
//  ProjectCardView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/3/24.
//

import SwiftUI

struct ProjectCardView: View {
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
                .shadow(radius: 10, x: 0, y: 4)
            VStack(alignment: .leading, spacing: 10) {
                Text("CodeWithShiva")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack(alignment: .center, spacing: 13) {
                    Spacer()
                    StatBubbleView(title: "Hours", stat: "200", gradientStartColor: Color("Navy"), gradientEndColor: Color("Blue"))
                    
                    StatBubbleView(title: "Sessions", stat: "34", gradientStartColor: Color("Green"), gradientEndColor: Color("Lime"))
                    
                    StatBubbleView(title: "Updates", stat: "20", gradientStartColor: Color("Maroon"), gradientEndColor: Color("Purple"))
                    
                    StatBubbleView(title: "Win", stat: "2", gradientStartColor: Color("Maroon"), gradientEndColor: Color("Olive"))
                    Spacer()
                }
                Text("My current foucs is...")
                    .font(.featuredText)
                    .foregroundStyle(.gray)
                Text("Design new website")
                    .font(.featuredText)
                    .foregroundStyle(.gray)
                    .bold()
            }
            .padding()
        }
    }
}


#Preview {
    ProjectCardView()
}
