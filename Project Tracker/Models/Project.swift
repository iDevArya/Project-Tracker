//
//  Project.swift
//  Project Tracker
//
//  Created by Shiva kumar Arya on 5/2/24.
//

import Foundation
import SwiftData

@Model
class Project: Identifiable {
    @Attribute(.unique) var id: String
    var name = ""
    var startDate = Date()
    var focus = ""
    @Relationship(deleteRule: .cascade, inverse: \ProjectUpdate.project)
    var updates:[ProjectUpdate] = [ProjectUpdate]()
    
    init() {
        id = UUID().uuidString
    }
}
