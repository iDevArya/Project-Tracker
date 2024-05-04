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
    
    @State private var projectUpdate: ProjectUpdate?
    
    @State private var showEditFocus = false
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color("Navy"), Color("Sky Blue")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            LinearGradient(colors: [Color("Washed Blue").opacity(0), Color("Sky Blue")], startPoint: .top, endPoint: .bottom)
                .frame(width: 1)
                .padding(.leading, -155)
            VStack() {
                VStack(alignment: .leading, spacing: 13) {
                    Text(project.name)
                        .font(.screenHeading)
                    
                    HStack(alignment: .center, spacing: 13) {
                        Spacer()
                        StatBubbleView(title: "Hours", stat: "200", gradientStartColor: Color("Navy"), gradientEndColor: Color("Sky Blue"))
                        
                        StatBubbleView(title: "Sessions", stat: "34", gradientStartColor: Color("Turtle Green"), gradientEndColor: Color("Lime"))
                        
                        StatBubbleView(title: "Updates", stat: "20", gradientStartColor: Color("Maroon"), gradientEndColor: Color("Fuschia"))
                        
                        StatBubbleView(title: "Win", stat: "2", gradientStartColor: Color("Maroon"), gradientEndColor: Color("Olive"))
                        Spacer()
                    }
                    
                    Text("My current focus is...")
                        .font(.featuredText)
                    HStack {
                        if (project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "") {
                            Button {
                                completeMileStone()
                            } label: {
                                Image(systemName: "checkmark.square")
                            }
                                
                        }
                        Text(project.focus.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? "Tap to set your focus" : project.focus)
                            .font(.featuredText)
                            .onTapGesture {
                                showEditFocus = true
                            }
                    }
                    .padding(.leading)
                    
                }
                .foregroundStyle(.white)
                .padding()
                .background {
                    Color.black
                        .opacity(0.7)
                        .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                        .ignoresSafeArea()
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 27) {
                        ForEach(project.updates.sorted(by: { u1, u2 in
                            u1.date > u2.date
                        })) { update in
                                ProjectUpdateView(update: update)
                        }
                    }
                    .padding()
                    .padding(.bottom, 80)
                }
            }
            VStack {
                Spacer()
                HStack {
                    Button {
                        // TODO: - Add Project Update
                        projectUpdate = ProjectUpdate()
                        
                    } label: {
                        ZStack(alignment: .center) {
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 65)
                            Image("cross")
                        }
                    }
                    .padding([.leading, .top])
                    Spacer()
                    Button("Back") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
                    .tint(.black)
                    .padding([.trailing, .top])
                }
                .background {
                    Color.black
                        .opacity(0.5)
                        .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                        .ignoresSafeArea()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(item: $projectUpdate) { update in
            AddUpdateView(project: project, update: update)
                .presentationDetents([.fraction(0.3)])
        }
        .sheet(isPresented: $showEditFocus) {
            EditFocusView(project: project)
                .presentationDetents([.fraction(0.2)])
        }
    }
    
    func completeMileStone() {
        let update = ProjectUpdate()
        update.updateType = .milestone
        update.headline = "Milestone Achieved"
        update.summary = project.focus
        project.updates.insert(update, at: 0)
        
        project.focus = ""
    }
}
#Preview {
    ProjectDetailView(project: Project())
}
