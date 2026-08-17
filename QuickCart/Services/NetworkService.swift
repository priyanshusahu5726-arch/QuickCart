//
//  NetworkService.swift
//  QuickCart
//
//  Created by priyanshu sahu on 17/07/26.
//

import Foundation

struct NetworkService {
    
    private let baseURL = "https://dummyjson.com"
    
    func fetchProducts() async throws -> [Product] {
        
        let endpoint = APIEndpoint.products
        
        guard let urlrequest = endpoint.urlRequest else {

            throw NetworkError.invalidURL

        }
        
        let productResponse = try await request(
            ProductResponse.self,
            with: urlrequest
        )
        
        return productResponse.products.map { $0.toProduct() }
        
    }
    
    
    
    private func decode<T: Decodable>(
        _ type: T.Type,
        from data: Data
    ) throws -> T {
        
        return try JSONDecoder().decode(
            T.self,
            from: data
        )
        
    }
    
    private func request<T: Decodable>(
        _ type: T.Type,
        with request: URLRequest
    ) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        return try decode(type, from: data)
    }
}
