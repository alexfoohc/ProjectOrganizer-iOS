//
//  ProjectOverviewView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 03/01/24.
//

import SwiftUI
import SwiftData

struct ProjectOverviewView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var project: Project
    var body: some View {
        NavigationLink(value: project) {
            Text(project.name)
        }
        .navigationTitle(project.name)
    }
}

