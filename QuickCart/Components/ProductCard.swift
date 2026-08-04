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
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
            
            
            Text(product.name)
                
            Text("$\(product.price, specifier: "%.2f")")
        }
       
    }
}

#Preview {
    ProductCard(
        product:  Product(
            name : "Apple",
            price: 2.99,
            image: "Apple",
            category: "Fruits",
            description: "Fresh red apple"
            
        )
    )
}
