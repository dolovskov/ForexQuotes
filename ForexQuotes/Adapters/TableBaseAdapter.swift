//
//  TableBaseAdapter.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//
import UIKit

protocol TableDataSourceDelegate: UITableViewDelegate, UITableViewDataSource {}

class TableBaseAdapter<Element>: NSObject, TableDataSourceDelegate  {
    
    var source: [Element] = []
    var onSelectElement: ((Element) -> ()) = { element in }
    var onSelectIndex: (Int) -> () = {index in}
    
    var isSourceEmpty: Bool {
        return source.isEmpty
    }
    
    init(source: [Element]) {
        self.source = source
    }
    
    func update(source: [Element]) {
        self.source = source
    }
    
    func append(source: [Element]) {
        self.source.append(contentsOf: source)
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    //MARK: - UITableViewDelegate
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelectIndex(indexPath.row)
        let element = source[indexPath.row]
        onSelectElement(element)
    }
}
