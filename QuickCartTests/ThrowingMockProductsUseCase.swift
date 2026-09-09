//
//  ThrowingMockProductsUseCase.swift
//  QuickCartTests
//
//  Created by priyanshu sahu on 08/09/26.
//

import Foundation
@testable import QuickCart

struct ThrowingMockGetProductsUseCase: GetProductsUseCaseProtocol {
    
    func execute() async throws -> [Product] {
        
        throw TestError.networkFailed
    }
}
