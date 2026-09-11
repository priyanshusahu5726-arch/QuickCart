//
//  AppContainer.swift
//  QuickCart
//
//  Created by priyanshu sahu on 10/09/26.
//

import Foundation
final class AppContainer{
    
    private let productRepository = ProductRepository()
    
    private let cartRepository = CartRepository()
    
    func makeHomeViewModel() -> HomeViewModel {

        let useCase = GetProductsUseCase(repository: productRepository)

        return HomeViewModel(getProductsUseCase: useCase)

    }
    
    func makeCartViewModel() ->CartViewModel{
    
        return CartViewModel(repository :  cartRepository)
    }
}
