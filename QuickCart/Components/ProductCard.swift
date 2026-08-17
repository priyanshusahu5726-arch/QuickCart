//
//  ProductCard.swift
//  QuickCart
//
//  Created by priyanshu sahu on 06/07/26.
//

import SwiftUI

struct ProductCard: View {
    let product : Product
    var body: some View {
        
        VStack(spacing : 8){
            AsyncImage(url: URL(string: product.image)) { image in

                image

                    .resizable()

                    .scaledToFit()

                    .frame(width: 80, height: 80)

            } placeholder: {

                Color.clear

                    .frame(width: 80, height: 80)

            }
            
            Text(product.name)
                
            Text("$\(product.price, specifier: "%.2f")")
        }
       
    }
}

#Preview {
    ProductCard(

            product: Product(

                id: 1,

                name: "Essence Mascara Lash Princess",

                price: 9.99,

                image: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",

                category: "beauty",

                description: "The Essence Mascara Lash Princess is a popular mascara..."

            )

        )

    }
