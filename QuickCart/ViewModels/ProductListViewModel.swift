//
//  ProductListViewModel.swift
//  QuickCart
//
//  Created by priyanshu sahu on 17/08/26.
//

import Foundation
import Combine

final class ProductListViewModel: ObservableObject {

    @Published
    var products: [Product] = []
    
    @Published
    var isLoading = false
    
    @Published
    var error: Error?
    
    private let networkService: NetworkService
    
    init(
        networkService: NetworkService = NetworkService()
    ) {
        self.networkService = networkService
    }
    
    func fetchProducts() async {

        isLoading = true

        error = nil
        
        defer{
            isLoading = false
        }

        do {

            products = try await networkService.fetchProducts()

        } catch {
            self.error = error
        }
    }
}
