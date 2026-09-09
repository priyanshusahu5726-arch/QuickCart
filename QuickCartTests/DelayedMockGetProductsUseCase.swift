//
//  DelayedMockGetProductsUseCase.swift
//  QuickCartTests
//
//  Created by priyanshu sahu on 08/09/26.
//

import Foundation
@testable import QuickCart
struct DelayedMockGetProductsUseCase: GetProductsUseCaseProtocol {

    func execute() async throws -> [Product] {

        try await Task.sleep(for: .seconds(1))

        return [

            Product(

                id: 1,

                name: "Mock Apple",

                price: 2.99,

                image: "Apple",

                category: "Fruits",

                description: "Delayed mock product"

            )

        ]

    }

}
