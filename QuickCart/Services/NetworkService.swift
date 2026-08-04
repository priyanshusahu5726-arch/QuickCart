//
//  NetworkService.swift
//  QuickCart
//
//  Created by priyanshu sahu on 17/07/26.
//

import Foundation

struct NetworkService {

    func fetchProducts() async throws -> [Product] {

        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw NetworkError.invalidURL
        }

        let (data,response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do{
            let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
            
            return productResponse.products
        }catch{
            throw NetworkError.invalidData
        }
    }

}
