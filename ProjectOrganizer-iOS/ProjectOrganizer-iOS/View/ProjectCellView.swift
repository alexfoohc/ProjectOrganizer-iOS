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
            VStack(alignment: .leading, spacing: 12, content: {
                Text(project.name)
                    .fontWeight(.bold)
                    .font(.title2)
                Text(project.detailedDescription)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 14))
                    
            })
        }
        .swipeActions {
            Button(role: .destructive) {
                modelContext.delete(project)
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

