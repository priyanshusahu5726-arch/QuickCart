//
//  CategoryCard.swift
//  QuickCart
//
//  Created by priyanshu sahu on 06/07/26.
//

import SwiftUI

struct CategoryCard: View {
    let category : Category
    let isSelected: Bool
    var body: some View {
        HStack{
            Text(category.icon)
                .foregroundStyle(

                    isSelected ? Color.white : Color.primary

                )
            
            Text(category.name)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(12)
        .background(
            isSelected ? Color.blue : Color.gray.opacity(0.15)
        )
        .cornerRadius(12)
        .animation(.easeInOut, value: isSelected)
    }
}

#Preview {
    CategoryCard(
        category: Category(
            name: "Fruits",
            icon : "🍎"
            
        ), isSelected: true
    )
}
