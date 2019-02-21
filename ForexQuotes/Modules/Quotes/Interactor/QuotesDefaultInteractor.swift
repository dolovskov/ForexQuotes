//
//  QuotesDefaultInteractor.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation

class QuotesDefaultInteractor: QuotesInteractor {
    
    weak var presenter: QuotesPresenter?
    var quotesService: QuotesService?
    var quotes: [QuoteCellModel] = []
    
    func getQuotesModel() {
        presenter?.showLoader()
        quotesService?.getQuotes { [weak self] (quotes) in
            var quotesModel: [QuoteCellModel] = []
            for quot in quotes {
                quotesModel.append(QuoteCellModel(quote: quot))
            }
            self?.quotes = quotesModel
            self?.presenter?.quotesModelLoaded(quotes: quotesModel)
            self?.presenter?.hideLoader()
        }
    }
    
    func updateQuote(index: Int) {
        let currentInterval = Date().timeIntervalSince1970
        let seconds = currentInterval - self.quotes[index].time
        guard seconds > quoteUpdateDelay else {return}
        let symbol = self.quotes[index].symbol
        self.quotesService?.updateQuote(symbol: symbol, { [weak self] (quote) in
            self?.quotes[index] = QuoteCellModel(quote: quote)
            guard let quotes = self?.quotes else {return}
            self?.presenter?.quoteUpdated(index: index, quotesModel: quotes)
        })
    }
    
}
