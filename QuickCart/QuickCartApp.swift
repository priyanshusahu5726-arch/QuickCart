//
//  QuickCartApp.swift
//  QuickCart
//
//  Created by priyanshu sahu on 02/07/26.
//

import SwiftUI

@main
struct QuickCartApp: App {
    
    let cartRepository: CartRepository
    let cartViewModel: CartViewModel
    
    let productRepository: ProductRepository
    let getProductsUseCase: GetProductsUseCase
    let homeViewModel: HomeViewModel
    
    init() {

        cartRepository = CartRepository()

        cartViewModel = CartViewModel(repository: cartRepository)
        
        productRepository = ProductRepository()
        getProductsUseCase = GetProductsUseCase(repository: productRepository)
        homeViewModel = HomeViewModel(getProductsUseCase: getProductsUseCase)

    }
   
    
    var body: some Scene {
        WindowGroup {
           MainTabView(
            cartViewModel: cartViewModel,
            homeViewModel: homeViewModel
           )
        }
    }
}
