//
//  APIEndpoint.swift
//  QuickCart
//
//  Created by priyanshu sahu on 11/08/26.
//

import Foundation
enum APIEndpoint {
    
    case products
    
    var path: String {
        
        switch self {
            
        case .products: return "/products"
            
        }
    }
    
    var method: HTTPMethod {
        
        switch self {
        case .products:
            return .GET
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .products:
            return [
                URLQueryItem(
                    name: "limit",
                    value: "20"
                ),
                URLQueryItem(
                    name: "skip",
                    value: "20"
                )
            ]
        }
    }
    
    var urlRequest: URLRequest? {
        var components = URLComponents(
            string: "https://dummyjson.com"
        )
        components?.path = path
        
        components?.queryItems = queryItems
        
        guard let url = components?.url else {
            return nil
        }
        
        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue
        
        return request
    }
}
