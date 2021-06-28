//
//  StockTableCell.swift
//  StockDemo
//
//  Created by Sahid Reza on 28/06/21.
//

import UIKit

class StockTableCell: UITableViewCell {
    
    @IBOutlet weak var sortNameLabel: UILabel!
    
    @IBOutlet weak var symBolLabel: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
