//
//  CartView.swift
//  QuickCart
//
//  Created by priyanshu sahu on 07/07/26.
//

import SwiftUI

struct CartView: View {
    @Environment(CartManager.self) private var cartManager
    @State private var showCheckoutAlert = false
    var body: some View {
        
        NavigationStack{
            VStack{
                
                
                if cartManager.items.isEmpty {

                    VStack(spacing: 20) {

                        Image(systemName: "cart")

                            .font(.system(size: 60))

                            .foregroundStyle(.gray)

                        Text("Your Cart is Empty")

                            .font(.title2)

                            .fontWeight(.bold)

                        Text("Add some products to get started!")

                            .foregroundStyle(.gray)

                    }

                    .frame(maxWidth: .infinity,

                           maxHeight: .infinity)

                } else {
                    List{
                        Section("Items"){
                            
                            ForEach(cartManager.items, id: \.id) { item in
                                
                                HStack{
                                    Image(systemName: item.product.image)
                                        .font(.title2)
                                    VStack(alignment: .leading){
                                        Text(item.product.name)
                                            .font(.headline)
                                        
                                        HStack{
                                            Button("-"){
                                                cartManager.decreaseQuantity(for: item)
                                            }
                                            .buttonStyle(.borderless)
                                            Text("Qty: \(item.quantity)")
                                                .frame(minWidth: 30)
                                            
                                            Button("+"){
                                                cartManager.increaseQuantity(for: item)
                                            }
                                            .buttonStyle(.borderless)
                                        }
                                        
                                        
                                        Button("Remove"){
                                            cartManager.removeItem(item)
                                        }
                                        .buttonStyle(.borderless)
                                        .foregroundStyle(.red)
                                    }
                                    Spacer()
                                    Text("$ \(item.product.price, specifier: "%.2f")")
                                }
                            }
                        }
                    }
                
                Section("Summary"){
                    HStack{
                        Text("Total:")
                        Spacer()
                        Text("$ \(cartManager.totalPrice, specifier: "%.2f")")
                            .fontWeight(.bold)
                    }
                }
            }
            Button("Checkout"){
                showCheckoutAlert = true
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .alert("Order Placed!", isPresented: $showCheckoutAlert) {

                Button("OK", role: .cancel) { }

            } message: {

                Text("Thank you for shopping with QuickCart!")

            }
           
        }
            .navigationTitle("Cart")
            
        }
    }
}

#Preview {
    CartView()
        .environment(CartManager())
}
