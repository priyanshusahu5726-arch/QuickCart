//
//  MainTabView.swift
//  QuickCart
//
//  Created by priyanshu sahu on 07/07/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    var body: some View {
        
        TabView(selection: $selectedTab){
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            SearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            CartView()
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
    MainTabView()
        .environment(CartManager())
}
