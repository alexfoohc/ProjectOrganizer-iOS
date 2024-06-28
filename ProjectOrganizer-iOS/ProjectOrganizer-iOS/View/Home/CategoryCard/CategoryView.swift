//
//  CategoryView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 16/04/24.
//

import SwiftUI

struct CategoryView: View {
    let category: Category
    var body: some View {
        GroupBox {
            Grid(verticalSpacing: 14) {
                GridRow {
                    Text(category.name)
                }
                GridRow {
                    Text("\(category.count)")
                        .gridCellAnchor(.bottomTrailing)
                }
                .frame(width: 151, height: 101)
            }
        }
    }
}

#Preview {
    CategoryView(category: Category(name: Categories.personal.rawValue, count: 0))
}
