//
//  ProjectOrganizer_iOSApp.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 02/01/24.
//

import SwiftUI

@main
struct ProjectOrganizer_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Category.self, Project.self, Feature.self, Note.self])
        }
    }
}
