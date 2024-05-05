//
//  MyListsView.swift
//  ProjectOrganizer-iOS
//
//  Created by Alejandro Hernandez on 16/04/24.
//

import SwiftUI

struct MyListsView: View {
    var body: some View {
        CategoryView(category: Category(name: Categories.personal.rawValue, count: 0))
    }
}

#Preview {
    MyListsView()
}
