//
//  QuotesAssembler.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation

class QuotesAssembler {
    func assemble(view: QuotesViewController) {
        let presenter = QuotesDefaultPresenter()
        presenter.view = view
        view.presenter = presenter
        let interactor = QuotesDefaultInteractor()
        interactor.presenter = presenter
        interactor.quotesService = QuotesDefaultService(forexApiProvider: ForexApiProvider(), saveQuoteService: SaveToUserDefaultService<Quote>())
        presenter.interactor = interactor
    }
}
