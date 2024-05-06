//
//  StatHelper.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/4/24.
//

import Foundation
import SwiftUI

struct StatHelper {
    
    // This method should be run after the new update has been added to project's updates arrayle
    static func updateAdded(project: Project, update: ProjectUpdate) {
        // Change the hours
        project.hours += update.hours
        
        // Change the wins
        if update.updateType == .milestone {
            project.wins += 1
        }
        
        // Change the sessions
        let sortedUpdates = project.updates.sorted { u1, u2 in
            u1.date >= u2.date
        }
        
        if sortedUpdates.count >= 2 {
            let date1 = sortedUpdates[0].date
            let date2 = sortedUpdates[1].date
            if !Calendar.current.isDate(date1, equalTo: date2, toGranularity: .day) {
                project.sessions += 1
            }
        } else {
            // Since there are less than 2 updates, then this is the first of today
            project.sessions += 1
        }
    }
    
    //Run this After the update has  been removed from project.updates array
    static func updateDeleted(project: Project, update: ProjectUpdate) {
        
        // Change Hours
        project.hours -= update.hours
        
        // Change the wins
        if update.updateType == .milestone {
            project.wins -= 1
        }
        
        // Change the sessions
        let samedayUpdates =  project.updates.filter { u in
            Calendar.current.isDate(u.date, inSameDayAs: update.date)
        }
        
        if samedayUpdates.count == 0 {
            // The Deleted update was the only update of that day
            project.sessions -= 1
        }
        
    }
    
    static func updateEdited(project: Project, hoursDiff: Double) {
        // Change hours
        project.hours += hoursDiff
    }
}


