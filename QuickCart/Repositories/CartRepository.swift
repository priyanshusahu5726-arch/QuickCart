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
        return []
    }

    func add(_ product: Product) {

    }

    func remove(_ product: Product) {

    }

    func increaseQuantity(for product: Product) {

    }

    func decreaseQuantity(for product: Product) {

    }

    func clearCart() {

    }

    func totalPrice() -> Double {
        return 0
    }
}
