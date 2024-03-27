//
//  ProjectDetailsView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 03/01/24.
//

import SwiftUI
import SwiftData

struct ProjectDetailsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.editMode) private var editMode
    @Bindable var project: Project
    @State private var textFieldDescription: String = ""
    @State private var disabledTextField = true
    @State private var isAddNotesPresented = false
    @State private var features: [Feature] = []
    @FocusState private var isDetailedDescriptionFocused: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12, content: {
                Text("Status: \(project.status.rawValue)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding()
                if editMode?.wrappedValue.isEditing == true {
                    TextField("", text: $project.detailedDescription)
                        .focused($isDetailedDescriptionFocused)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding()
                } else {
                    Text(project.detailedDescription)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding()
                }
                
//                Text(project.detailedDescription)
//                    .font(.subheadline)
//                    .foregroundStyle(.secondary)
//                    .padding()
            })
            
            
            List {
                Section("Features ⭐️") {
                    TextField("Add new feature", text: $textFieldDescription)
                        .onSubmit {
                            let feature = Feature(detailedDescription: textFieldDescription)
                            self.features.append(feature)
                            textFieldDescription = ""
                            
                            for feature in features {
                                self.project.addFeature(feature: feature)
                            }
                            // TODO: Sort the items added
                        }
                        
                    ForEach(project.features) { feature in
                        Text(feature.detailedDescription)
                        //                        FeaturesCellView(features: project.features)
                    }
                    .onDelete { indexSet in
                        project.removeFeatureLocated(at: indexSet)
                    }
                }
                Section("Notes 📓") {
                    ForEach(project.notes) { note in
                        Text(note.title)
                        
                    }
                }
            }
        }
        .navigationTitle(project.name)
        .sheet(isPresented: $isAddNotesPresented, content: {
            NavigationStack {
                AddNotesView(project: project)
            }
        })
        .toolbar {
            Button {
                isAddNotesPresented.toggle()
            } label: {
                Text("Add Notes")
            }
//            Button {
//                disabledTextField.toggle()
//            } label: {
//                Text(buttonText)
//            }
            EditButton()
        }
        
        
    }
    
    private func checkIfEditModeIsOn() {
        
    }
}
