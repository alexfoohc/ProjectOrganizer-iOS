//
//  CategoryView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 16/04/24.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 150, height: 104)
                .cornerRadius(10)
                .overlay(
                    // Top Left Label
                    Text("Top Left")
                        .padding(8)
                        .foregroundColor(.black)
                        .alignmentGuide(.top) { _ in 0 } // Align to top leading corner
                )
                .overlay(
                    // Bottom Right Label
                    Text("Bottom Right")
                        .padding(8)
                        .foregroundColor(.black)
                        .alignmentGuide(.bottom) { _ in 0 } // Align to bottom trailing corner
                        .alignmentGuide(.trailing) { _ in 3 }
                )
        }
    }
    
    
}


#Preview {
    CategoryView(category: Category(name: Categories.personal.rawValue, count: 2))
}
