//
//  CartRepository.swift
//  QuickCart
//
//  Created by priyanshu sahu on 25/08/26.
//

import Foundation

final class CartRepository: CartRepositoryProtocol {
    
    private var items: [CartItem] = []
    
    func fetchCartItems() -> [CartItem] {
        items
    }
    // add items in cart
    func add(_ product: Product) {

        if let index = items.firstIndex(where: {
            $0.product.id == product.id
        }) {

            items[index].quantity += 1

        } else {

            let cartItem = CartItem(
                product: product,
                quantity: 1
            )

            items.append(cartItem)

        }
        
    }
    // remove items
    func remove(_ product: Product) {

        if let index = items.firstIndex(where: {
            $0.product.id == product.id
        }) {

            items.remove(at: index)

        }

    }
    
    //increase quantity
    func increaseQuantity(for product: Product) {

        if let index = items.firstIndex(where: {
            $0.product.id == product.id
        }) {

            items[index].quantity += 1

        }

    }
    
    // decrease  cart item and remove them if its less than 1 .
    func decreaseQuantity(for product: Product) {

        if let index = items.firstIndex(where: {
            $0.product.id == product.id
        }) {

            if items[index].quantity > 1 {

                items[index].quantity -= 1

            } else {

                items.remove(at: index)

            }

        }
        

    }
    
    // remove all items at once from the cart
    func clearCart() {
        items.removeAll()
    }
    
    // calclulate total
    func totalPrice() -> Double {

        var total = 0.0

        for item in items {

            total += item.product.price * Double(item.quantity)

        }

        return total

    }
}
