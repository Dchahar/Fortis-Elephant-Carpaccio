//
//  ItemsTableViewCell.swift
//  Fortis Bank
//
//  Created by Dheeraj Chahar on 16/04/19.
//  Copyright © 2019 Tata Consultancy Services. All rights reserved.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    @IBOutlet weak var itemUnitPriceLabel: UILabel!
    @IBOutlet weak var itemTotalPriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(itemAdded: ItemEntry) {
        itemNameLabel.text = itemAdded.itemName
        itemQuantityLabel.text = String(itemAdded.itemQuantity)
        itemUnitPriceLabel.text = String(itemAdded.itemPrice)
        itemTotalPriceLabel.text = String(Int(itemAdded.itemQuantity)!*Int(itemAdded.itemPrice)!)
    }

}
