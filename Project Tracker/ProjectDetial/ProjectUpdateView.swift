//
//  ProjectUpdateView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/4/24.
//

import SwiftUI

struct ProjectUpdateView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .shadow(radius: 5, x: 0, y: 4)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Friday, May 3, 2024")
                        .padding(.leading)
                    Spacer()
                    Text("9 Hours")
                        .padding(.trailing)
                        
                }
                .padding(.vertical, 5)
                .background {
                    Color("Orchid")
                }
                
                Text("Made progress on the progress bar")
                    .font(.smallHeadline)
                    .padding(.horizontal)
                
                Text("Lorem ipusm sjbabaejgaiebrgabvavygrybaklgyralyrfabaiurgayrbalrgav. abeuvyawlria.")
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
    ProjectUpdateView()
}
