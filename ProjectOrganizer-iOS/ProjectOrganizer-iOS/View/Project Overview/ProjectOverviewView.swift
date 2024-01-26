//
//  ProjectOverviewView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 03/01/24.
//

import SwiftUI
import SwiftData

struct ProjectOverviewView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.editMode) private var editMode
    @Bindable var project: Project
    @State private var textFieldDescription: String = ""
    @State private var disabledTextField = true
    @State private var buttonText = "Edit"
    @State private var isAddNotesPresented = false
    
    var body: some View {
        VStack(alignment: .leading, content: {
            List {
                Section("Features") {
                    Text("Hey")
                    TextField("Add new feature", text: $textFieldDescription)
                        .onSubmit {
                            
                            // TODO: Add new feature here
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

