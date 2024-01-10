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
    
    var body: some View {
        VStack(alignment: .leading, content: {
            
        })
        .navigationTitle(project.name)
        .toolbar {
            Button(action: {
                disabledTextField.toggle()
            }, label: {
                Text(buttonText)
            })
        }
    }
}

