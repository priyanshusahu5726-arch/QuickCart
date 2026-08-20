//
//  MockProductRepository.swift
//  QuickCart
//
//  Created by priyanshu sahu on 20/08/26.
//

import Foundation

import Foundation

struct MockProductRepository: ProductRepositoryProtocol {

    func fetchProducts() async throws -> [Product] {
        
        return [
            Product(
                id: 1,
                name: "Mock Apple",
                price: 2.99,
                image: "Apple",
                category: "Fruits",
                description: "Fake product for testing."
            )
        ]
    }
}
