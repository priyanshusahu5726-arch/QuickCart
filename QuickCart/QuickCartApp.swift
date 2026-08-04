//
//  QuickCartApp.swift
//  QuickCart
//
//  Created by priyanshu sahu on 02/07/26.
//

import SwiftUI

@main
struct QuickCartApp: App {
    let cartManager = CartManager()
    var body: some Scene {
        WindowGroup {
           MainTabView()
                .environment(cartManager)
        }
    }
}
