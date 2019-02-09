//
//  QuotesView.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation

protocol QuotesView {
    func updateQuotesModel(quotesModel: [QuoteCellModel])
    func updateQuote(index: Int, quotesModel: [QuoteCellModel])
    
    func showLoader()
    func hideLoader()
}
