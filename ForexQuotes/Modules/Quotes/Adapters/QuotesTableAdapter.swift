//
//  QuotesTableAdapter.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import UIKit

class QuotesTableAdapter: TableBaseAdapter<QuoteCellModel> {
    
    var onShowCell: (Int) -> () = {index in}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuotesCell.cellIdentifier, for: indexPath) as? QuotesCell else {
            return UITableViewCell()
        }
        cell.configureCell(model: source[indexPath.row])
        onShowCell(indexPath.row)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return quoteCellHeight
    }
}
