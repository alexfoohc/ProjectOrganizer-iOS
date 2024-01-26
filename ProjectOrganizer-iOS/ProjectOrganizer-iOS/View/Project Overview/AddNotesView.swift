//
//  AddNotesView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 25/01/24.
//

import SwiftUI

struct AddNotesView: View {
    @Environment(\.dismiss) private var isDismissed
    var body: some View {
        Form {
            Section("Test") {
                
            }
            
        }
        .navigationTitle("Add New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    
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
