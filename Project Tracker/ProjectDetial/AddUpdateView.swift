//
//  AddUpdateView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/4/24.
//

import SwiftUI

struct AddUpdateView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    var update: ProjectUpdate
    
    @State var headLine: String = ""
    @State var summary: String = ""
    @State var hours: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("New Update")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                
                TextField("Headline:", text: $headLine)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Summary:", text: $summary, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                
                HStack {
                    TextField("Hours:", text: $hours)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .frame(width: 70)
                    Button("Save") {
                        // Save Project to SwiftData
                        update.headline = headLine
                        update.summary = summary
                        update.hours = Double(hours)!
                        project.updates.append(update)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
                
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

#Preview {
    AddUpdateView(project: Project(), update: ProjectUpdate())
}
