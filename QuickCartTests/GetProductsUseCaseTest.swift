//
//  GetProductsUseCaseTest.swift
//  QuickCartTests
//
//  Created by priyanshu sahu on 09/09/26.
//


import XCTest
@testable import QuickCart
@MainActor
final class GetProductsUseCaseTests: XCTestCase {
    
    func test_execute_returnsProducts() async throws {

        // Arrange

        let repository = MockProductRepository()

        let useCase = GetProductsUseCase(repository: repository)

        // Act

        let products = try await useCase.execute()

        // Assert

        XCTAssertEqual(products.count, 1)

        XCTAssertEqual(products.first?.name, "Mock Apple")

    }

}
