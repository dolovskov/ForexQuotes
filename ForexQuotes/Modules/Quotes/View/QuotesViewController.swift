//
//  QuotesViewController.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController, QuotesView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Public vars
    
    var tableAdapter: QuotesTableAdapter?
    var presenter: QuotesPresenter?
    
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        initTableAdapter()
        tableSettings()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Public methods
    
    func updateQuotesModel(quotesModel: [QuoteCellModel]) {
        self.tableAdapter?.update(source: quotesModel)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    
    func updateQuote(index: Int, quotesModel: [QuoteCellModel]) {
        self.tableAdapter?.update(source: quotesModel)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
        }
    }
    
    func showLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.startAnimating()
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
        }
    }
    
    // MARK: - Private methods
    
    private func registerCell() {
        let quoteNib = UINib(nibName: QuotesCell.cellIdentifier, bundle: nil)
        tableView.register(quoteNib, forCellReuseIdentifier: QuotesCell.cellIdentifier)
    }
    
    private func initTableAdapter() {
        tableAdapter = QuotesTableAdapter(source: [])
        tableView.delegate = tableAdapter
        tableView.dataSource = tableAdapter
        
        tableAdapter?.onShowCell = { [weak self] index in
            self?.presenter?.onShowCell(index: index)
        }
    }
    
    private func tableSettings() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.tableFooterView = UIView(frame: .zero)
    }
    

}
