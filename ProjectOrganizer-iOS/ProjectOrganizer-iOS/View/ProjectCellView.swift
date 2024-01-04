//
//  ProjectCellView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 03/01/24.
//

import SwiftUI

struct ProjectCellView: View {
    @Environment(\.modelContext) private var modelContext
    var project: Project
    
    var body: some View {
        NavigationLink(value: project) {
            VStack(alignment: .leading, content: {
                Text(project.name)
                Text(project.detailedDescription)
                    .foregroundStyle(.secondary)
            })
        }
        .swipeActions {
            Button(role: .destructive) {
                
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            Button(action: {
                
            }, label: {
                Label("Archive", systemImage: "archivebox")
            })

        }
    }
    
}

