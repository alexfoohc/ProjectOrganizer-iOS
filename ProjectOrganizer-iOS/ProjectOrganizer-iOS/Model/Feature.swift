//
//  Feature.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 02/01/24.
//

import SwiftData
import SwiftUI

@Model
class Feature {
    @Attribute(.unique) var detailedDescription: String
    var creationDate: Date
    var isDone: Bool
    
    init(detailedDescription: String, isDone: Bool = false) {
        self.detailedDescription = detailedDescription
        self.creationDate = .now
        self.isDone = isDone
    }
}
