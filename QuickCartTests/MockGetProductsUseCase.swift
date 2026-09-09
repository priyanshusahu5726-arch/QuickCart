//
//  MockGetProductsUseCase.swift
//  QuickCartTests
//
//  Created by priyanshu sahu on 07/09/26.
//

import Foundation
@testable import QuickCart

struct MockGetProductsUseCase: GetProductsUseCaseProtocol{
    
    func execute() async throws -> [Product]{
        [

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
