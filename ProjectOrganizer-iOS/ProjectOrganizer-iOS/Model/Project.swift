//
//  Project.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 02/01/24.
//

import Foundation
import SwiftData

enum ProjectStatus: String, Codable, CaseIterable, Identifiable {
    case active
    case canceled
    case postponed
    case archived
    
    var id: Self { self }
}

//enum ProjectCategory: String, Codable, CaseIterable, Identifiable {
//    case 
//}

@Model
class Project {
    @Attribute(.unique) var name: String
    var detailedDescription: String
    var status: ProjectStatus
    var creationDate: Date
    
    init(name: String, detailedDescription: String, status: ProjectStatus) {
        self.name = name
        self.detailedDescription = detailedDescription
        self.status = status
        self.creationDate = .now
    }
    
    @Relationship(deleteRule: .cascade)
    var features: [Feature] = []
    
  
}
