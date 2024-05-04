//
//  ContentView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/2/24.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    
    @State private var newProject: Project?
    
    @Query private var project: [Project]
    
    @Environment(\.modelContext) private var context
    
    @State private var selectedProject: Project?
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("Project")
                        .font(.screenHeading)
                        .foregroundStyle(.white)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 26) {
                            ForEach(project) { p in
                                
                                ProjectCardView(project: p)
                                    .onTapGesture {
                                        selectedProject = p
                                    }
                                    .onLongPressGesture {
                                        newProject = p
                                    }
                                
                            }
                            
                        }
                    }
                }
                .padding()
                
                VStack() {
                    Spacer()
                    HStack {
                        Button(action: {
                            newProject = Project()
                        }, label: {
                            ZStack {
                                Circle()
                                    .frame(height: 65)
                                    .foregroundColor(.black)
                                Image("cross")
                            }
                            
                        })
                        Spacer()
                    }
                }
                .padding()
            }
            .navigationDestination(item: $selectedProject) { project in
                ProjectDetailView(project: project)
            }
        }
        .sheet(item: $newProject) { project in
            let isEdit =  project.name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            EditProjectView(project: project, isEditMode: isEdit)
                .presentationDetents([.fraction(0.2)])
        }
    }
}


#Preview {
    ProjectListView()
}
