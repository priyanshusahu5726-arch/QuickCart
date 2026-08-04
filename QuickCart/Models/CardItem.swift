//
//  CardItem.swift
//  QuickCart
//
//  Created by priyanshu sahu on 07/07/26.
//

import Foundation

struct CartItem: Identifiable {

    let id = UUID()

    let product: Product

    var quantity: Int

}
