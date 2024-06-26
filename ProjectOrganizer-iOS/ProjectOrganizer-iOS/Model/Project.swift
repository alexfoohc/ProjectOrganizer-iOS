//
//  Project.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 02/01/24.
//

import Foundation
import SwiftData
import SwiftUI

enum ProjectStatus: String, Codable, CaseIterable, Identifiable {
    case active = "Active"
    case postponed = "Postponed"
    case done = "Done"
    case canceled = "Canceled"
    
    var id: Self { self }
}

@Model
class Project {
    @Attribute(.unique) var name: String
    var detailedDescription: String
    var status: ProjectStatus
    var creationDate: Date
    var category: Categories
    
    init(name: String, detailedDescription: String, status: ProjectStatus, category: Categories) {
        self.name = name
        self.detailedDescription = detailedDescription
        self.status = status
        self.creationDate = .now
        self.category = category
    }
    
    func addFeature(feature: Feature) {
        self.features.append(feature)
    }
    
    func removeFeatureLocated(at offsets: IndexSet) {
        self.features.remove(atOffsets: offsets)
    }
    
    func addNote(note: Note) {
        self.notes.append(note)
    }
    
    func removeNoteLocated(at offsets: IndexSet) {
        self.notes.remove(atOffsets: offsets)
    }
    
    @Relationship(deleteRule: .cascade)
    var features: [Feature] = [Feature]()
    
    @Relationship(deleteRule: .cascade)
    var notes: [Note] = []
    
    
}
