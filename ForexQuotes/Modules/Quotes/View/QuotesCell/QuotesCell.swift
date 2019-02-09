//
//  QuotesCell.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import UIKit

class QuotesCell: UITableViewCell {
    
    static let cellIdentifier = "QuotesCell"
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bidAscLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: QuoteCellModel) {
        self.symbolLabel.text = model.symbol
        self.priceLabel.text = model.price
        self.bidAscLabel.text = "bid: \(model.bid), ask: \(model.ask)"
        self.timeLabel.text = TimeConventer.updatedTimeString(from: model.time)
    }
}
