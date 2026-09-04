//
//  DelayMockProductRepository.swift
//  QuickCartTests
//
//  Created by priyanshu sahu on 03/09/26.
//

import Foundation
@testable import QuickCart

struct DelayedMockProductRepository: ProductRepositoryProtocol {
    
    func fetchProducts() async throws -> [QuickCart.Product] {
    
        try await Task.sleep(for: .seconds(2))
        
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
