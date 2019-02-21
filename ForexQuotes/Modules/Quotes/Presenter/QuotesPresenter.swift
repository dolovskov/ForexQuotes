//
//  QuotesPresenter.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation

protocol QuotesPresenter: class {
    func viewDidLoad()
    func quotesModelLoaded(quotes: [QuoteCellModel])
    func onShowCell(index: Int)
    func quoteUpdated(index: Int, quotesModel: [QuoteCellModel])
    
    func showLoader()
    func hideLoader()
}
