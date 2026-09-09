//
//  GetProductUseCase.swift
//  QuickCart
//
//  Created by priyanshu sahu on 06/09/26.
//

import Foundation
struct GetProductsUseCase : GetProductsUseCaseProtocol{
    
    private let repository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol = ProductRepository()) {
            self.repository = repository
        }
    
    func execute() async throws -> [Product] {
        return try await repository.fetchProducts()
    }
}
