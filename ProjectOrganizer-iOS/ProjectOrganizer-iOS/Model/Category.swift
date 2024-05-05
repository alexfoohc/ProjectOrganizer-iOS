//
//  Category.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 16/04/24.
//

import Foundation
import SwiftUI
import SwiftData

enum Categories: String, Codable, CaseIterable, Identifiable {
   
    
    case personal = "Personal"
    case business = "Business"
    case todo = "ToDo"
    
    var id: Self { self }
}

@Model
class Category {
    @Attribute(.unique) var name: String
    let count: Int
    
    init(name: String, count: Int) {
        self.name = name
        self.count = count
    }
    
    func addProject(project: Project) {
        self.projects.append(project)
    }
    func deleteProjectAt(offsets: IndexSet) {
        self.projects.remove(atOffsets: offsets)
    }
    
    @Relationship(deleteRule: .cascade)
    var projects: [Project] = [Project]()
}
