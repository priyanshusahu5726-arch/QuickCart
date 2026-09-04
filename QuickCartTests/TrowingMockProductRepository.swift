//
//  TrowingMockProductRepository.swift
//  QuickCartTests
//
//  Created by priyanshu sahu on 04/09/26.
//

import Foundation
@testable import QuickCart

enum TestError: Error {
    case networkFailed
}

struct ThrowingMockProductRepository: ProductRepositoryProtocol {

    func fetchProducts() async throws -> [Product]{
        
        throw TestError.networkFailed
    }
}
