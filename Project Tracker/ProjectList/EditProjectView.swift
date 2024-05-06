//
//  AddProjectView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/3/24.
//

import SwiftUI
import SwiftData

struct EditProjectView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    var isEditMode: Bool
    
    @State private var projectName: String = ""
    @State private var showConfimation = false
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Project" : "Add Project")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Project Name:", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                        .onChange(of: projectName) { oldValue, newValue in
                            projectName = TextHelper.limitCharacters(input: projectName, limit: 30)
                        }
                    
                    Button(isEditMode ? "Save" : "Add") {
                        // Save Project to SwiftData
                        if isEditMode {
                            project.name = projectName
                        } else {
                            project.name = projectName
                            context.insert(project)
                        }
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(projectName.trimmingCharacters(in: .whitespacesAndNewlines) == "")
                    
                    
                    if isEditMode {
                        Button("Delete") {
                            showConfimation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }  
        .confirmationDialog("Do you want to Delete this Project?", isPresented: $showConfimation, titleVisibility: .visible) {
            Button("Yes, Delete") {
                context.delete(project)
                dismiss()
            }
        }
        .onAppear {
            projectName = project.name
        }
    }
}

