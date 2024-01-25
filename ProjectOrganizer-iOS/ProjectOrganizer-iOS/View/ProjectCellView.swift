//
//  ProjectCellView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 03/01/24.
//

import SwiftUI

enum SwipeActionIcon: String {
    case active = ""
    case postponed = "hourglass"
    case done = "checkmark.circle.fill"
    case canceled = "multiply"
}

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
        .frame(height: 90)
        .swipeActions(edge: .leading, allowsFullSwipe: true, content: {
            setButtonForSwipeAction(for: .done)
            setButtonForSwipeAction(for: .postponed)
        })
        .swipeActions(edge: .trailing, content: {
            Button(role: .destructive) {
                modelContext.delete(project)
            } label: {
                Label("Delete", systemImage: "trash.fill")
            }
            setButtonForSwipeAction(for: .canceled)
        })
    }
    
    private func setButtonForSwipeAction(for status: ProjectStatus) -> some View {
        let iconColor: Color
        let swipeAction: SwipeActionIcon
        switch status {
        case .active:
            iconColor = Color.clear
            swipeAction = .active
        case .postponed:
            iconColor = Color.yellow
            swipeAction = .postponed
        case .done:
            iconColor = Color.green
            swipeAction = .done
        case .canceled:
            iconColor = Color.red
            swipeAction = .canceled
        }
        return Button {
            project.status = status
            modelContext.insert(project)
        } label: {
            Label(status.rawValue, systemImage: swipeAction.rawValue)
        }.tint(iconColor)
    }
}


