//
//  GetProductUseCaseProtocol.swift
//  QuickCart
//
//  Created by priyanshu sahu on 06/09/26.
//

import Foundation
protocol GetProductsUseCaseProtocol {

    func execute() async throws -> [Product]

}
