//
//  CartRepository.swift
//  QuickCart
//
//  Created by priyanshu sahu on 25/08/26.
//

import Foundation

final class CartRepository: CartRepositoryProtocol {
    
    private var items: [CartItem] = []
    
    private let persistence: CartPersistence
    
    init(persistence: CartPersistence = CartPersistence()) {
        self.persistence = persistence
    }
    
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
        saveCart()
    }
    
    // remove items
    func remove(_ product: Product) {
        
        if let index = items.firstIndex(where: {
            $0.product.id == product.id
        }) {
            
            items.remove(at: index)
            
        }
        saveCart()
    }
    
    //increase quantity
    func increaseQuantity(for product: Product) {
        
        if let index = items.firstIndex(where: {
            $0.product.id == product.id
        }) {
            
            items[index].quantity += 1
            
        }
        saveCart()
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
        saveCart()
        
    }
    
    // remove all items at once from the cart
    func clearCart() {
        items.removeAll()
        saveCart()
    }
    
    // calclulate total
    func totalPrice() -> Double {
        
        var total = 0.0
        
        for item in items {
            
            total += item.product.price * Double(item.quantity)
            
        }
        
        return total
        
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
    
    // restore cart from save
    func restoreCart(using products: [Product]) {
        
        do {
            
            let savedItems = try persistence.load()
            
            let restoredItems: [CartItem] = savedItems.compactMap { savedItem -> CartItem? in
                
                guard let product = products.first(where: { product in
                    
                    product.id == savedItem.productID
                    
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
