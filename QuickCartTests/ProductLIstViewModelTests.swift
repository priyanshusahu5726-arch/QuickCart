//
//  ProductLIstViewModelTests.swift
//  QuickCartTests
//
//  Created by priyanshu sahu on 02/09/26.
//

import XCTest
@testable import QuickCart

final class ProductListViewModelTests: XCTestCase {

    @MainActor
    func testFetchProductsLoadsProductsSuccessfully() async throws {

        // Arrange
        let repository = MockProductRepository()
        let viewModel = ProductListViewModel(repository: repository)

        // Act
        await viewModel.fetchProducts()

        // Assert
        XCTAssertEqual(viewModel.products.count, 1)
        XCTAssertEqual(viewModel.products.first?.name, "Mock Apple")
    }
    @MainActor
    func testLoadingStateChanges() async {
            
        // Arrange

           let repository = DelayedMockProductRepository()

           let viewModel = ProductListViewModel(repository: repository)
        
        // Act
           let task = Task {
                await viewModel.fetchProducts()
            }
        try? await Task.sleep(for: .milliseconds(50))
        
        // Assert

            XCTAssertTrue(viewModel.isLoading)
        
            await task.value
        
        XCTAssertFalse(viewModel.isLoading)
    }
    
    
    @MainActor
    func testFetchProductsSetsErrorWhenRepositoryThrows() async {
        
        //Arrange
        let repository = ThrowingMockProductRepository()

        let viewModel = ProductListViewModel(repository: repository)
        
        // Act

        await viewModel.fetchProducts()
        
        //Assert
        XCTAssertNotNil(viewModel.error)
        
        XCTAssertTrue(viewModel.products.isEmpty)
    }
}
