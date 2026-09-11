//
//  HomeViewModelTests.swift
//  QuickCartTests
//
//  Created by priyanshu sahu on 02/09/26.
//

import XCTest
@testable import QuickCart
@MainActor
final class HomeViewModelTests: XCTestCase {

    
    func testLoadProductsLoadsProductsSuccessfully() async throws {

        // Arrange
        let repository = MockGetProductsUseCase()
        let viewModel =  HomeViewModel(getProductsUseCase:  repository)

        // Act
        await viewModel.loadProducts()

        // Assert
        XCTAssertEqual(viewModel.products.count, 1)
        XCTAssertEqual(viewModel.products.first?.name, "Mock Apple")
    }
    
  
    func testLoadingStateChanges() async {
            
        // Arrange

           let repository = DelayedMockGetProductsUseCase()

           let viewModel = HomeViewModel(getProductsUseCase:  repository)
        
        // Act
           let task = Task {
                await viewModel.loadProducts()
            }
        try? await Task.sleep(for: .milliseconds(50))
        
        // Assert

            XCTAssertTrue(viewModel.isLoading)
        
            await task.value
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.products.count, 1)
    }
    
    
    
    func testLoadProductsSetsErrorWhenUseCaseThrows() async {
        
        //Arrange
        let repository = ThrowingMockGetProductsUseCase()

        let viewModel = HomeViewModel(getProductsUseCase:  repository)
        
        // Act

        await viewModel.loadProducts()
        
        //Assert
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.products.isEmpty)
    }
}
