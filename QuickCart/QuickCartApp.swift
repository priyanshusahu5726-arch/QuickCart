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
    
    init() {

        cartRepository = CartRepository()

        cartViewModel = CartViewModel(repository: cartRepository)

    }
    
    var body: some Scene {
        WindowGroup {
           MainTabView(
            cartViewModel: cartViewModel
           )
        }
    }
}
