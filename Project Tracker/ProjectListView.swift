//
//  ContentView.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/2/24.
//

import SwiftUI

struct ProjectListView: View {
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
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                    }
                }
            }
            .padding()
            
            VStack() {
                Spacer()
                HStack {
                    Button(action: {
                        //TODO: -
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
        
    }
}

#Preview {
    ProjectListView()
}
