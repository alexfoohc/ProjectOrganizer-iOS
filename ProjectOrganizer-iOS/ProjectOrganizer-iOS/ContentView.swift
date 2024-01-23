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
                        Section("Active") {
                            ForEach(projects.filter({$0.status == .active})) { project in
                                ProjectCellView(project: project)
                            }
                        }
                        Section("Postponed") {
                            ForEach(projects.filter({$0.status == .postponed})) { project in
                                ProjectCellView(project: project)
                            }
                        }
                        
                        Section("Archived") {
                            ForEach(projects.filter({$0.status == .archived})) { project in
                                ProjectCellView(project: project)
                            }
                        }
                        
                        Section("Canceled") {
                            ForEach(projects.filter({$0.status == .canceled})) { project in
                                ProjectCellView(project: project)
                            }
                        }
//                        ForEach(projects) {
//                            ProjectCellView(project: $0)
//                        }
                    }
                }
            }
            .navigationTitle("My Projects")
            .navigationDestination(for: Project.self) { ProjectOverviewView(project: $0)}
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showAddProjectView.toggle()
                }
            }
            .sheet(isPresented: $showAddProjectView, content: {
                NavigationStack {
                    NewProjectView()
                }
                .navigationTitle("Add New Project")
            })
            
        }
    }    
}

#Preview {
    ContentView()
}
