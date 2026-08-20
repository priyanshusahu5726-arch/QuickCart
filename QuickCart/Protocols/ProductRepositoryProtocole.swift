//
//  ProductRepositoryProtocole.swift
//  QuickCart
//
//  Created by priyanshu sahu on 20/08/26.
//

import Foundation

protocol ProductRepositoryProtocol {
    
    func fetchProducts() async throws -> [Product]
}
