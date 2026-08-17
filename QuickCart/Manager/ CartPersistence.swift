//
//   CartPersistence.swift
//  QuickCart
//
//  Created by priyanshu sahu on 09/08/26.
//

import Foundation
struct CartPersistence {
    private let userDefaults: UserDefaults
    private let cartKey = "quickcart.cart"
    
    init(userDefaults: UserDefaults = .standard) {
        
        self.userDefaults = userDefaults
    }
        
        //saving in userdefault
        func save(_ items: [PersistedCartItem]) throws {
            let encoder = JSONEncoder()
            
            let data = try encoder.encode(items)

            userDefaults.set(data, forKey: cartKey)
        }
        
        //loading from user default
        func load() throws -> [PersistedCartItem] {
            guard let data = userDefaults.data(forKey: cartKey) else {
                
                return []
            }
            let decoder = JSONDecoder()

                return try decoder.decode(

                    [PersistedCartItem].self,

                    from: data

                )
            
        }
    }

