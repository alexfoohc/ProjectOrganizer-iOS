//
//  ContentView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddProjectView: Bool = false
    var projects: [String] = ["2"]
    var body: some View {
        NavigationStack {
            Group {
                if projects.isEmpty {
                    ContentUnavailableView("No projects", systemImage: "folder", description: Text("Tap on Add to add new projects"))
                } else {
                    List {
                        
                    }
                }
            }
            .navigationTitle("My Projects")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    addNewProject()
                    
                } .navigationDestination(isPresented: $showAddProjectView) {
                    NewProjectView()
                }
                
            }
            
        }
    }
    
    private func addNewProject() {
        showAddProjectView.toggle()
       
    }
}

#Preview {
    ContentView()
}
