//
//  Quote.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation

struct Quote: Codable {
    
    var symbol: String
    var price: Double
    var bid: Double
    var ask: Double
    var timestamp: Double
    
}
