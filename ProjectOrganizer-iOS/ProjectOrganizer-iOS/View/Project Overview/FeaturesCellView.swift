//
//  FeaturesCellView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 25/01/24.
//

import SwiftUI

struct FeaturesCellView: View {
    @Environment(\.modelContext) private var modelContext
    var features: [Feature]
    
    var body: some View {
        HStack {
            VStack {
                
            }
        }
        .swipeActions {
            Button(role: .destructive) {
//                let index = project.features.firstIndex(of: feature)
                
            } label: {
                
            }
            
        }
        
    }
        
}
