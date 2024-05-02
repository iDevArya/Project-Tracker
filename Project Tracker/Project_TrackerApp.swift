//
//  Project_TrackerApp.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/2/24.
//

import SwiftUI
import SwiftData

@main
struct Project_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(for: [Project.self, ProjectUpdate.self])
        }
    }
}
