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
    
    var creationDate: Date
    
    init(creationDate: Date) {
        self.creationDate = creationDate
    }
}
