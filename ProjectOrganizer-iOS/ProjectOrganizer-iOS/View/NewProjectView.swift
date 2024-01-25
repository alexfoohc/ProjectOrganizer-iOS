//
//  NewProjectView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 02/01/24.
//

import SwiftUI

struct NewProjectView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var isDismissed
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var isActive: Bool = false
    @State private var status: ProjectStatus = .active
    @State private var featureDescription: String = ""
    var body: some View {
        Form {
            Section("Project properties") {
                VStack(alignment: .leading, spacing: 12, content: {
                    TextField("Project name", text: $name)
                    
                    TextField("Project description", text: $description, axis: .vertical)
                        .foregroundStyle(.secondary)
                })
            }
            
            Section("Project Status") {
                Picker("Current status", selection: $status) {
                    ForEach(ProjectStatus.allCases) { status in
                        Text(status.rawValue.capitalized)
                    }
                }
            }
            
            Section("Features") {
                TextField("New feature", text: $featureDescription)
                    .onSubmit {
                        let feature = Feature(detailedDescription: featureDescription, isDone: false)
                        
                    }
            }
        }
        .navigationTitle("Add New Project")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(role: .cancel, action: {
                    isDismissed()
                }, label: {
                    Text("Cancel")
                })
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // TODO: Add a function to validate empty fields before creating a new project
                    let project = Project(name: name, detailedDescription: description, status: status)
                    modelContext.insert(project)
                    isDismissed()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}
