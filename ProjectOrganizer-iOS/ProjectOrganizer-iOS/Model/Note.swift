//
//  Note.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 25/01/24.
//

import Foundation
import SwiftData

@Model
class Note {
    
    @Attribute(.unique) var title: String
    var text: String
    var creationDate: Date
    
    init(title: String, text: String, creationDate: Date) {
        self.title = title
        self.text = text
        self.creationDate = creationDate
    }
}
