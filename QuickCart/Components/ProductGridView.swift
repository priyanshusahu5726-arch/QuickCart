//
//  ProductGridView.swift
//  QuickCart
//
//  Created by priyanshu sahu on 15/07/26.
//

import SwiftUI

struct ProductGridView: View {
    let products: [Product]

        let columns = [

            GridItem(.flexible()),

            GridItem(.flexible())

        ]
    var body: some View {
       
        LazyVGrid(columns: columns) {

            ForEach(products) { currentProduct in

                NavigationLink {

                    ProductDetailView(product: currentProduct)

                } label: {

                    ProductCard(product: currentProduct)

                }

            }

        }
    }
}

#Preview {
    ProductGridView(products: [])
}
