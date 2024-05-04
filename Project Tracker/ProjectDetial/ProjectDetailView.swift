//
//  ProjectDetailView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/3/24.
//

import SwiftUI

struct ProjectDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    var body: some View {
        VStack {
            Text(project.name)
                .navigationBarBackButtonHidden(true)
            Button("Back") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .foregroundColor(.white)
        }
     
        
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
