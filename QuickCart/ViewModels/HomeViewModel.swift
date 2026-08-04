//
//  HomeViewModel.swift
//  QuickCart
//
//  Created by priyanshu sahu on 11/07/26.
//

import Foundation
import Observation

enum SortOption {

    case name

    case priceLowToHigh

    case priceHighToLow

}

@Observable

class HomeViewModel {
    private let networkService = NetworkService()

    let categories = [

            Category(name: "Fruits", icon: "🍎"),

            Category(name: "Vegetables", icon: "🥬"),

            Category(name: "Dairy", icon: "🥛"),

            Category(name: "Snacks", icon: "🍿"),

            Category(name: "Drinks", icon: "🥤")

        ]

    var products: [Product] = []
    
    var isLoading = false
    
    var errorMessage: String?
    
    var searchText = ""
    
    var selectedCategory: String? = nil
    
    var selectedSortOption: SortOption = .name
    
    init() {
        Task{
          await  loadProducts()
        }
    }
    
    var filteredProducts: [Product] {

        var filtered = products

        if let selectedCategory {

            filtered = filtered.filter { product in

                product.category == selectedCategory

            }

        }

        if !searchText.isEmpty {

            filtered = filtered.filter { product in

                product.name.localizedCaseInsensitiveContains(searchText)

            }

        }
        //ennum short products
        switch selectedSortOption {

        case .name:

            filtered.sort {

                $0.name < $1.name

            }

        case .priceLowToHigh:

            filtered.sort {

                $0.price < $1.price

            }

        case .priceHighToLow:

            filtered.sort {

                $0.price > $1.price

            }

        }

        return filtered

    }
    
    /* private func loadProducts() {

        guard let url = Bundle.main.url(

            forResource: "products",

            withExtension: "json"

        ) else {

            return

        }
        do {
            let data = try Data(contentsOf: url)
            let decodedProducts = try JSONDecoder().decode(
                [Product].self,
                from: data
            )
            products = decodedProducts

        }catch {

            print("Error loading products:", error)

        }
    }*/
    func loadProducts() async {

        
            isLoading = true
            errorMessage = nil

            do {

                products = try await networkService.fetchProducts()
               
            } catch {
                isLoading = false

                if let networkError = error as? NetworkError {

                    switch networkError {

                    case .invalidURL:

                        errorMessage = "Invalid URL."

                    case .invalidResponse:

                        errorMessage = "The server returned an invalid response."

                    case .invalidData:

                        errorMessage = "Unable to read product data."

                    }

                } else {

                    errorMessage = error.localizedDescription

                }

            }
        isLoading = false

    }
    
}
