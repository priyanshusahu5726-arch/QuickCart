//
//  ProductDTO.swift
//  QuickCart
//
//  Created by priyanshu sahu on 08/08/26.
//

import Foundation

struct ProductDTO: Decodable {
    let id: Int
    let title: String
    let price: Double
    let thumbnail: String
    let category: String
    let description: String
}
