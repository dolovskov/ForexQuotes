//
//  QuotesService.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation

protocol QuotesService {
    func getQuotes(_ onCompletion: @escaping ([Quote]) -> Void)
    func updateQuote(symbol: String,_ onCompletion: @escaping (Quote) -> Void)
}

class QuotesDefaultService: QuotesService {
    
    var forexApiProvider: ForexApiProvider
    var saveQuoteService: SaveToUserDefaultService<Quote>
    
    init(forexApiProvider: ForexApiProvider, saveQuoteService: SaveToUserDefaultService<Quote>) {
        self.forexApiProvider = forexApiProvider
        self.saveQuoteService = saveQuoteService
    }
    
    func getQuotes(_ onCompletion: @escaping ([Quote]) -> Void) {
        let quotesSaved: [Quote] = saveQuoteService.restore()
        if quotesSaved.count > 0 {
            let updates = setDetailQuotes(quotes: quotesSaved)
            onCompletion(updates)
        }
        forexApiProvider.request(path: ForexPaths.symbols, responseAs: String.self) { [weak self] (symbols) in
            var quotes: [Quote] = []
            for symbol in symbols {
                let quote = Quote(symbol: symbol, price: 0, bid: 0, ask: 0, timestamp: 0)
                quotes.append(quote)
            }
            self?.saveQuoteService.save(models: quotes)
            let updates = self?.setDetailQuotes(quotes: quotes) ?? quotes
            onCompletion(updates)
        }
    }
    
    func updateQuote(symbol: String,_ onCompletion: @escaping (Quote) -> Void) {
        forexApiProvider.request(path: ForexPaths.quotes, parameters: ["pairs":symbol], responseAs: Quote.self) { [weak self] (quotes) in
            if let quote = quotes.first {
                self?.saveQuoteService.save(model: quote, key: symbol)
                onCompletion(quote)
            }
        }
    }
    
    private func setDetailQuotes(quotes: [Quote]) -> [Quote] {
        var quotesUpdate: [Quote] = []
        for quote in quotes {
            if let quoteSaved = saveQuoteService.restore(key: quote.symbol) {
                quotesUpdate.append(quoteSaved)
            } else {
                quotesUpdate.append(quote)
            }
        }
        return quotesUpdate
    }
}
