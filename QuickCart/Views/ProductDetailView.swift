//
//  ProductDetailView.swift
//  QuickCart
//
//  Created by priyanshu sahu on 06/07/26.
//

import SwiftUI

struct ProductDetailView: View {
    let product : Product
    @State private var quantity = 1
    @Environment(CartManager.self) private var cartManager
    var body: some View {
        VStack(spacing: 20){
            Image(product.image)
                .resizable()
                    .scaledToFit()
                    .frame(height: 250)
            
            Text(product.name)
                .font(.largeTitle)
            
            Text("$\(product.price, specifier: "%.2f")")
                .font(.title)
            
            Text(product.description)
                
            HStack{
                Button("-"){
                    if quantity > 1{
                        quantity -= 1
                    }
                }
                Text("\(quantity)")
                Button("+"){
                  quantity += 1
                }
            }
            Button("Add to cart"){
                cartManager.addItem(
                    product: product,
                    quantity: quantity
                    )
               
            }
            .buttonStyle(.borderedProminent)
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ProductDetailView(
        product:  Product(
            name : "Apple",
            price : 5.0 ,
            image: "Apple",
            category: "Fruits",
            description: "Fresh red apple"
        )
    )
    .environment(CartManager())
}
