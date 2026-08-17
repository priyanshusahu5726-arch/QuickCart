//
//  Product+Mapping.swift
//  QuickCart
//
//  Created by priyanshu sahu on 08/08/26.
//

import Foundation

extension ProductDTO {
    func toProduct() -> Product {
        Product(
            id: id,
            name: title,
            price: price,
            image: thumbnail,
            category: category,
            description: description
        )
    }
}
