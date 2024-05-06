//
//  AddUpdateView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/4/24.
//

import SwiftUI

struct EditUpdateView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    var update: ProjectUpdate
    var isEditMode: Bool
    
    @State private var headLine: String = ""
    @State private var summary: String = ""
    @State private var hours: String = ""
    @State private var showConfirmation = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Update" : "New Update")
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
                    Button(isEditMode ? "Save" : "Add") {
                        // Save Project to SwiftData
                        let hoursDiff = Double(hours)! - update.hours 
                        update.headline = headLine
                        update.summary = summary
                        update.hours = Double(hours)!
                        
                        
                        if !isEditMode {
                            project.updates.insert(update, at: 0)
                            
                            try? context.save()
                            StatHelper.updateAdded(project: project, update: update)
                        } else {
                            StatHelper.updateEdited(project: project, hoursDiff: hoursDiff)
                        }
                        
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                    if isEditMode {
                        Button("Delete") {
                           showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Do you want to Delete the Update?", isPresented: $showConfirmation) {
            Button("Yes, Delete") {
                project.updates.removeAll { u in
                    u.id == update.id
                }
                try? context.save()
                StatHelper.updateDeleted(project: project, update: update)
                dismiss()
            }
        }
        .onAppear {
            headLine = update.headline
            summary = update.summary
            hours = String(Int(update.hours))
        }
    }
}

#Preview {
    EditUpdateView(project: Project(), update: ProjectUpdate(), isEditMode: Bool())
}
