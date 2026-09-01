//
//  CartRepositoryProtocol.swift
//  QuickCart
//
//  Created by priyanshu sahu on 25/08/26.
//

import Foundation
protocol CartRepositoryProtocol {
    
    func fetchCartItems() -> [CartItem]
    

        func add(_ product: Product)

        func remove(_ product: Product)

        func increaseQuantity(for product: Product)

        func decreaseQuantity(for product: Product)

        func clearCart()

        func totalPrice() -> Double
    
        func restoreCart(using products: [Product])
       
}
