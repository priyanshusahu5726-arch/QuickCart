//
//  CartView.swift
//  QuickCart
//
//  Created by priyanshu sahu on 07/07/26.
//

import SwiftUI

struct CartView: View {
   let viewModel: CartViewModel
    @State private var showCheckoutAlert = false
    var body: some View {
        
        NavigationStack{
            VStack{
                
                
                if viewModel.items.isEmpty {

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
                            
                            ForEach(viewModel.items, id: \.id) { item in
                                
                                HStack{
                                    Image(systemName: item.product.image)
                                        .font(.title2)
                                    VStack(alignment: .leading){
                                        Text(item.product.name)
                                            .font(.headline)
                                        
                                        HStack{
                                            Button("-"){
                                                viewModel.decreaseQuantity(for: item.product)
                                            }
                                            .buttonStyle(.borderless)
                                            Text("Qty: \(item.quantity)")
                                                .frame(minWidth: 30)
                                            
                                            Button("+"){
                                                viewModel.increaseQuantity(for: item.product)
                                            }
                                            .buttonStyle(.borderless)
                                        }
                                        
                                        
                                        Button("Remove"){
                                            viewModel.remove(item.product)
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
                        Text("$ \(viewModel.totalPrice, specifier: "%.2f")")
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
        .onAppear {

            viewModel.loadCartItems()

        }
        
    }
}

#Preview {
    CartView(
        viewModel: CartViewModel(
            repository: CartRepository()
        )
    )
}
