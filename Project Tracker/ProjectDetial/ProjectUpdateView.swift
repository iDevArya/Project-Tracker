//
//  ProjectUpdateView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/4/24.
//

import SwiftUI

struct ProjectUpdateView: View {
    
    var update: ProjectUpdate
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .shadow(radius: 5, x: 0, y: 4)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(DateHelper.convertDate(date: update.date))
                        .padding(.leading)
                    Spacer()
                    if update.updateType == .milestone {
                        Image(systemName: "star.fill")
                            .padding(.trailing)
                            .foregroundColor(.yellow)
                    } else  {
                        Text("\(String(Int(update.hours))) Hours")
                            .padding(.trailing)
                    }
                }
                .padding(.vertical, 5)
                .background {
                    Color(update.updateType == .milestone ? "Tiffany Teal" : "Orchid")
                }
                
                Text(update.headline)
                    .font(.smallHeadline)
                    .padding(.horizontal)
                
                Text(update.summary)
                    .padding(.horizontal)
                    .padding(.vertical)
            }
            .foregroundStyle(.white)
            .font(.regularText)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ProjectUpdateView(update: ProjectUpdate())
}
