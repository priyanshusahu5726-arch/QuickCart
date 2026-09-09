//
//  MockProductsRepository.swift
//  QuickCartTests
//
//  Created by priyanshu sahu on 09/09/26.
//

import Foundation
@testable import QuickCart


struct MockProductRepository: ProductRepositoryProtocol {

    func fetchProducts() async throws -> [Product] {

        return [

            Product(

                id: 1,

                name: "Mock Apple",

                price: 2.99,

                image: "Apple",

                category: "Fruits",

                description: "Mock product"

            )

        ]

    }

}
