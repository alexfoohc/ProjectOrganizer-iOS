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
                        ForEach(projects) { project in
                            Text(project.name)
                        }
                    }
                }
            }
            .navigationTitle("My Projects")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showAddProjectView.toggle()
                } .navigationDestination(isPresented: $showAddProjectView) {
                    NewProjectView()
                }
                
            }
            
        }
    }
    
    
}

#Preview {
    ContentView()
}
