//
//  QuotesInteractor.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation

protocol QuotesInteractor: class {
    func getQuotesModel()
    func updateQuote(index: Int)
}
