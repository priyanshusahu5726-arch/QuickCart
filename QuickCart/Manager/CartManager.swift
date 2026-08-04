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

    }
    func removeItem(_ item: CartItem) {

        items.removeAll { currentItem in

            currentItem.id == item.id

        }

    }
    func increaseQuantity(for item: CartItem) {
        guard let index = items.firstIndex(where: { itemInCart in

            itemInCart.id == item.id

        }) else {

            return

        }
        items[index].quantity += 1

    }
    
    func decreaseQuantity(for item: CartItem) {
        guard let index = items.firstIndex(where: { itemInCart in

            itemInCart.id == item.id

        }) else {

            return

        }
        if items[index].quantity > 1 {
            items[index].quantity -= 1

        }else{
            removeItem(item)
        }

    }
    

}
