//
//  Category.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 16/04/24.
//

import Foundation

enum Categories: String {
    case personal = "Personal"
    case business = "Business"
    case todo = "ToDo"
}


struct Category {
    let name: String
    var count: Int
    
    init(name: String, count: Int) {
        self.name = name
        self.count = count
    }
}
