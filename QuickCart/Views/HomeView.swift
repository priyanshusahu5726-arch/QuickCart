//
//  HomeView.swift
//  QuickCart
//
//  Created by priyanshu sahu on 02/07/26.
//

import SwiftUI

struct HomeView: View {
   
    
    @State private var viewModel = HomeViewModel()
    @Environment(CartManager.self) private var cartManager
    
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                VStack(spacing: 20){
                    
                    HStack{
                        VStack(alignment: .leading){
                            
                            HStack{
                                Image(systemName: "location.fill")
                                Text("Deliver to")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                
                            }
                            Text("Priyanshu Sahu")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        
                        
                        Image(systemName: "bell")
                            .font(.title2)
                    }
                    
                    .padding()
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        TextField("Search groceries...", text: $viewModel.searchText)
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    
                    ZStack(alignment : .leading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                        
                        VStack(alignment: .leading, spacing: 8){
                            Text("⚡ FREE DELIVERY")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("On your forst 3 order ")
                                .foregroundStyle(.white.opacity(0.9))
                            
                        }
                        
                    }
                    .frame(height: 180)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        
                        Text("Categories")
                            .font(.title2)
                            .fontWeight(.bold)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 16){
                                
                                ForEach(viewModel.categories){currentCategory in
                                    Button {
                                        if viewModel.selectedCategory == currentCategory.name {

                                            viewModel.selectedCategory = nil

                                        } else {

                                            viewModel.selectedCategory = currentCategory.name

                                        }

                                    } label: {

                                        CategoryCard(category: currentCategory,
                                        isSelected: viewModel.selectedCategory == currentCategory.name)

                                    }

                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
// Products
                    VStack(alignment : .leading){
                        HStack {

                            Text("Products")
                                .font(.title2)
                                .fontWeight(.bold)

                            Spacer()

                            Menu("Sort") {

                                Button("Name") {

                                    viewModel.selectedSortOption = .name

                                }

                                Button("Price ↑") {

                                    viewModel.selectedSortOption = .priceLowToHigh

                                }

                                Button("Price ↓") {

                                    viewModel.selectedSortOption = .priceHighToLow

                                }

                            }

                        }
                        
                        if viewModel.isLoading {

                            ProgressView("Loading Products...")

                                .frame(maxWidth: .infinity)

                                .padding(.vertical, 40)

                        } else if let error = viewModel.errorMessage {

                            VStack(spacing: 16) {

                                Image(systemName: "wifi.slash")

                                    .font(.system(size: 50))

                                    .foregroundStyle(.red)

                                Text("Failed to Load Products")

                                    .font(.headline)

                                Text(error)

                                    .foregroundStyle(.gray)

                                    .multilineTextAlignment(.center)

                            }

                            .frame(maxWidth: .infinity)

                        } else if viewModel.filteredProducts.isEmpty {

                            VStack(spacing: 16) {

                                Image(systemName: "magnifyingglass")

                                    .font(.system(size: 50))

                                    .foregroundStyle(.gray)

                                Text("No Products Found")

                                    .font(.headline)

                                Text("Try another search or category.")

                                    .foregroundStyle(.gray)

                            }

                            .frame(maxWidth: .infinity)

                        } else {
                            ProductGridView(products: viewModel.filteredProducts)
                        }
                    }
                    .padding(.horizontal)
                    
                }
            }
            .refreshable {

             await   viewModel.loadProducts()

            }
            .task {

                await viewModel.loadProducts()

                cartManager.restoreCart(using: viewModel.products)

            }
        }
    }
}
#Preview {
    HomeView()
        .environment(CartManager())
}
