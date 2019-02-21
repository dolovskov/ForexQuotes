//
//  QuotesDefaultPresenter.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation

class QuotesDefaultPresenter: QuotesPresenter {
    
    
    weak var view: QuotesView?
    var interactor: QuotesInteractor?
    
    
    func viewDidLoad() {
        interactor?.getQuotesModel()
    }
    
    func quotesModelLoaded(quotes: [QuoteCellModel]) {
        view?.updateQuotesModel(quotesModel: quotes)
    }
    
    func onShowCell(index: Int) {
        interactor?.updateQuote(index: index)
    }
    
    func quoteUpdated(index: Int, quotesModel: [QuoteCellModel]) {
        view?.updateQuote(index: index, quotesModel: quotesModel)
    }
    
    func showLoader() {
        view?.showLoader()
    }
    
    func hideLoader() {
        view?.hideLoader()
    }
}
