//
//  ContentView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 02/01/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showAddProjectView: Bool = false
    
    

    @Query var projects: [Project]
    
    var body: some View {
        NavigationStack {
            Group {
                if projects.isEmpty {
                    ContentUnavailableView("No projects", systemImage: "folder", description: Text("Tap on Add to add new projects"))
                } else {
                    List {
                        ForEach(ProjectStatus.allCases, id: \.self) { status in
                            Section(status.rawValue) {
                                presentViews(for: status)
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("My Projects")
            .navigationDestination(for: Project.self) { ProjectDetailsView(project: $0)}
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showAddProjectView.toggle()
                }
            }
            .sheet(isPresented: $showAddProjectView, content: {
                NavigationStack {
                    NewProjectView()
                }
            })
        }
    }
    
    @ViewBuilder
    private func presentViews(for status: ProjectStatus) -> some View {
        ForEach(projects.filter({$0.status == status})) { project in
            ProjectCellView(project: project)
        }
    }
}

#Preview {
    ContentView()
}
