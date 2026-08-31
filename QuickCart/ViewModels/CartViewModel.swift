//
//  CartViewModel.swift
//  QuickCart
//
//  Created by priyanshu sahu on 28/08/26.
//
import Foundation
import Observation

@Observable

final class CartViewModel {

    private let repository: CartRepositoryProtocol
    
    var items: [CartItem] = []
    
    init(repository: CartRepositoryProtocol) {

        self.repository = repository

    }
    func loadCartItems() {

        items = repository.fetchCartItems()

    }
    //add
    func add(_ product: Product) {
        repository.add(product)
        loadCartItems()
    }
    
    // remove at item
    func remove(_ product: Product) {

        repository.remove(product)

        loadCartItems()

    }
    
    //increase quantity for items in cart
    func increaseQuantity(for product: Product) {

        repository.increaseQuantity(for: product)

        loadCartItems()

    }
    
    // decrease quantity for cart items
    func decreaseQuantity(for product: Product){
        
        repository.decreaseQuantity(for: product)
        
        loadCartItems()
    }
    
    // clart cart
    func clearCart(){
        
        repository.clearCart()
        
        loadCartItems()
    }
    
    // calculate total price
    var totalPrice: Double{
        
      repository.totalPrice()
        
    }
}
