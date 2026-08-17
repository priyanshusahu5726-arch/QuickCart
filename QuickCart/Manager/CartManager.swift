//
//  CartManager.swift
//  QuickCart
//
//  Created by priyanshu sahu on 07/07/26.
//

import Foundation

import Observation

@Observable

class CartManager {

    var items: [CartItem] = []
    
    private let persistence: CartPersistence
    
    
    init(persistence: CartPersistence = CartPersistence()) {

        self.persistence = persistence

    }
    
    var totalPrice: Double {

        items.reduce(0) { result, item in

            result + (item.product.price * Double(item.quantity))

        }

    }
    
    func addItem(product: Product, quantity: Int) {
        if let index = items.firstIndex(where: { item in

            item.product.id == product.id

        }) {
            items[index].quantity += quantity
        }else {
            
            let cartItem = CartItem(
                product: product,
                quantity: quantity
            )

            items.append(cartItem)

        }
        saveCart()

    }
    
    func removeItem(_ item: CartItem) {

        items.removeAll { currentItem in

            currentItem.id == item.id

        }
        saveCart()

    }
    
    
    func increaseQuantity(for item: CartItem) {
        guard let index = items.firstIndex(where: { itemInCart in

            itemInCart.id == item.id

        }) else {

            return

        }
        items[index].quantity += 1
        
        saveCart()
    }
    
    
    
    func decreaseQuantity(for item: CartItem) {
        guard let index = items.firstIndex(where: { itemInCart in

            itemInCart.id == item.id

        }) else {

            return

        }
        if items[index].quantity > 1 {
            items[index].quantity -= 1
            
            saveCart()

        }else{
            removeItem(item)
        }

    }
    
    
    
    private func makePersistedItems() -> [PersistedCartItem] {

        items.map { cartItem in

            PersistedCartItem(

                productID: cartItem.product.id,

                quantity: cartItem.quantity

            )

        }

    }
    
    private func saveCart() {

        do {

            try persistence.save(makePersistedItems())

        } catch {

            print("Failed to save cart: \(error)")

        }

    }
    
    // restoring cart
    func restoreCart(using products: [Product]) {
        do {

            let savedItems = try persistence.load()
            
            // for loop  savedItems = [(A,B,C) : 1, (A,nil,C), (A,B)]
            
            let restoredItems :[CartItem] = savedItems.compactMap { savedItem -> CartItem? in // 0

                guard let product = products.first(where: { product in

                    product.id == savedItem.productID // 1 == 1

                }) else {

                    return nil

                }

                return CartItem(

                    product: product,

                    quantity: savedItem.quantity

                )

            }
            
            items = restoredItems

        } catch {

            print("Failed to load cart: \(error)")

        }

    }

}
