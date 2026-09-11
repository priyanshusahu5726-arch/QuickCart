//
//  QuickCartApp.swift
//  QuickCart
//
//  Created by priyanshu sahu on 02/07/26.
//

import SwiftUI

@main
struct QuickCartApp: App {
    
    let container = AppContainer()
   
    
    var body: some Scene {
        WindowGroup {
           MainTabView(
            cartViewModel: container.makeCartViewModel(),
            homeViewModel: container.makeHomeViewModel()
           )
        }
    }
}
