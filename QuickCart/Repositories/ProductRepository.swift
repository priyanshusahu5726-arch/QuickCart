//
//  ProductRepository.swift
//  QuickCart
//
//  Created by priyanshu sahu on 20/08/26.
//

import Foundation
struct ProductRepository: ProductRepositoryProtocol {

    private let networkService = NetworkService()
    
    func fetchProducts() async throws -> [Product] {

        return try await networkService.fetchProducts()

    }
}
