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
    
    var body: some View {
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
        .sheet(item: $newProject) { project in
            AddProjectView(project: project)
                .presentationDetents([.fraction(0.2)])
        }
        
    }
}

#Preview {
    ProjectListView()
}
