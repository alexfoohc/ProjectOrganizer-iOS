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
    @State private var buttonText = "Edit"
    @State private var isAddNotesPresented = false
    @State private var features: [Feature] = []
    
    var body: some View {
        VStack(alignment: .leading, content: {
            List {
                Section("Features") {
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
                Section("Notes") {
                    
                }
            }
        })
        .navigationTitle(project.name)
        .sheet(isPresented: $isAddNotesPresented, content: {
            NavigationStack {
                AddNotesView()
            }
        })
        .toolbar {
            Button {
                isAddNotesPresented.toggle()
            } label: {
                Text("Add Notes")
            }
            Button {
                disabledTextField.toggle()
            } label: {
                Text(buttonText)
            }
        }
    }
    
    private func checkIfEditModeIsOn() {
        
    }
}
