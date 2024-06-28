//
//  MyListsView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 16/04/24.
//

import SwiftUI

struct MyListsView: View {
    var categories = [Category(name: Categories.personal.rawValue, count: 0),
                      Category(name: Categories.business.rawValue, count: 0),
                      Category(name: Categories.todo.rawValue, count: 0)]
    
    var body: some View {
//        CategoryView(category: Category(name: Categories.personal.rawValue, count: 0))
        Grid(alignment: .leading, horizontalSpacing: 25, verticalSpacing: 14) {
            GridRow {
                VStack {
                    Text(categories[0].name)
                    Text("\(categories[0].count)")
                }
            }
        }
    }
}

#Preview {
    MyListsView()
}
