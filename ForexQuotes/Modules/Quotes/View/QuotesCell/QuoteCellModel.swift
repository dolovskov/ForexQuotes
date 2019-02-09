//
//  QuoteCellModel.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation

struct QuoteCellModel {
    
    var symbol: String
    var price: String
    var bid: String
    var ask: String
    var time: Double
    
    init(quote: Quote) {
        self.symbol = quote.symbol
        self.price = quote.price.toString()
        self.bid = quote.bid.toString()
        self.ask = quote.ask.toString()
        self.time = quote.timestamp
    }
}
