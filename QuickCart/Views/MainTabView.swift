//
//  MainTabView.swift
//  QuickCart
//
//  Created by priyanshu sahu on 07/07/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    let cartViewModel: CartViewModel

    var body: some View {
        
        TabView(selection: $selectedTab){
            HomeView(
                cartViewModel: cartViewModel
            )
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            SearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            CartView(viewModel: cartViewModel)
                .tabItem{
                    Label("cart", systemImage: "cart")
                }
                .tag(2)
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                }
                .tag(3)
        }
    }
}

#Preview {
    MainTabView(
        cartViewModel: CartViewModel(
            repository: CartRepository()
        )
    )
       
}
