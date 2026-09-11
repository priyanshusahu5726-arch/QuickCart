//
//  AppContainer.swift
//  QuickCart
//
//  Created by priyanshu sahu on 10/09/26.
//

import Foundation
final class AppContainer{
    
    func makeHomeViewModel() -> HomeViewModel {

        let repository = ProductRepository()

        let useCase = GetProductsUseCase(repository: repository)

        return HomeViewModel(getProductsUseCase: useCase)

    }
    
    func makeCartViewModel() ->CartViewModel{
        let cartRepository = CartRepository()
        
        return CartViewModel(repository :  cartRepository)
    }
}
