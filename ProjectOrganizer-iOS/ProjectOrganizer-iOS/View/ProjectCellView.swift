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
    @State private var isMenuShown: Bool = false
    @State private var isAlertShown: Bool = false
    
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
        .swipeActions(edge: .trailing, content: {
            Button(role: .destructive) {
                isAlertShown.toggle()
                //                modelContext.delete(project)
            } label: {
                Label("Delete", systemImage: "trash.fill")
            }
            
            Button {
                isMenuShown.toggle()
                
            } label: {
                Label("Status", systemImage: "checklist")
            }
            //            setButtonForSwipeAction(for: .canceled)
        })
        .alert(isPresented: $isAlertShown) {
            Alert(title: Text("Delete project"), message: Text("Are you sure you want to delete this project?"), primaryButton: .destructive(Text("Yes"), action: {
                modelContext.delete(project)
            }), secondaryButton: .cancel())
        }
        .sheet(isPresented: $isMenuShown) {
            Text("Testing")
                .presentationDetents([.fraction(0.25)])
        }        
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

