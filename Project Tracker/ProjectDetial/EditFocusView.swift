//
//  EditFocusView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/4/24.
//

import SwiftUI
import SwiftData

struct EditFocusView: View {
    
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    @State var focus: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Edit Project Focus")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Focus:", text: $focus)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Save") {
                        
                        project.focus = focus
                        
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}
