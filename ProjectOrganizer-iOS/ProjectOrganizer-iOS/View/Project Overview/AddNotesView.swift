//
//  AddNotesView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 25/01/24.
//

import SwiftUI

struct AddNotesView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var isDismissed
    @Bindable var project: Project
    @State private var detailedDescription = ""
    @State private var noteTitle = ""
    @State private var notes: [Note] = []
    var body: some View {
        Form {
            Section("Note") {
                TextField("Give it a title...", text: $noteTitle, axis: .vertical)
                    .padding()
                TextField("Let's start writing your ideas", text: $detailedDescription, axis: .vertical)
                    .padding()
            }
            
        }
        .navigationTitle("New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let note = Note(title: noteTitle, text: detailedDescription, creationDate: Date.now)
                    project.addNote(note: note)
                    isDismissed()
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    isDismissed()
                }
            }
        }
    }
    
    
}

//#Preview {
//    AddNotesView()
//}
