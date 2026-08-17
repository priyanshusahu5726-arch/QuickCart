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

        product: Product(

            id: 1,

            name: "Essence Mascara Lash Princess",

            price: 9.99,

            image: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",

            category: "beauty",

            description: "The Essence Mascara Lash Princess is a popular mascara..."

        )

    )

    .environment(CartManager())

}
