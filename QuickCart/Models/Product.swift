//
//  Product.swift
//  QuickCart
//
//  Created by priyanshu sahu on 06/07/26.
//

import Foundation
struct Product : Identifiable, Codable{
    let id = UUID()
    let name: String
    let price: Double
    let image: String
    let category: String
    let description : String
}
