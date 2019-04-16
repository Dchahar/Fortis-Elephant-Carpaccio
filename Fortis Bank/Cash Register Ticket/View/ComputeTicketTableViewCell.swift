//
//  ComputeTicketTableViewCell.swift
//  Fortis Bank
//
//  Created by Dheeraj Chahar on 16/04/19.
//  Copyright © 2019 Tata Consultancy Services. All rights reserved.
//

import UIKit

class ComputeTicketTableViewCell: UITableViewCell {
    
    @IBOutlet weak var totalWithoutTaxLabel: UILabel!
    @IBOutlet weak var totalDiscountLabel: UILabel!
    @IBOutlet weak var totalTaxLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func calculateTicket(items: [ItemEntry]) {
        
        var totalAmount:Float = 0.0
        var totalTax:Float = 0.0
        
        items.forEach { (item) in
            totalAmount = totalAmount + Float(Int(item.itemQuantity)!*Int(item.itemPrice)!)
            totalTax = totalTax + totalAmount * (Float(item.itemTaxStateCode)!/100)
        }
        
        
        let discountedAmount = totalAmount * (calculateDiscountRate(totalOrderValue: totalAmount)/100)
        let totalPrice = calculateTotalPrice(totalWithoutTax: totalAmount, discount: discountedAmount, tax: totalTax)
        
        totalWithoutTaxLabel.text = String(totalAmount)
        totalDiscountLabel.text = String(calculateDiscountRate(totalOrderValue: totalAmount))
        totalTaxLabel.text = String(totalTax)
        totalPriceLabel.text = String(totalPrice)
    }
    
}

private extension ComputeTicketTableViewCell {
    
    func calculateDiscountRate(totalOrderValue: Float) -> Float {
        
        var discountRate: Float! = Float()
        
        switch (totalOrderValue) {
        case _ where totalOrderValue < 5000 && totalOrderValue > 1000:
            discountRate = DiscountRate.greaterThanThousand.rawValue
        case _ where totalOrderValue < 7000 && totalOrderValue > 5000:
            discountRate = DiscountRate.greaterThanFiveThousand.rawValue
        case _ where totalOrderValue < 10000 && totalOrderValue > 7000:
            discountRate = DiscountRate.greaterThanSevenThousand.rawValue
        case _ where totalOrderValue < 50000 && totalOrderValue > 10000:
            discountRate = DiscountRate.greaterThanTenThousand.rawValue
        case _ where totalOrderValue > 50000 :
            discountRate = DiscountRate.greaterThanFiftyThousand.rawValue
        default:
            discountRate = 0.0
        }
        
        return discountRate
    }
    
    func calculateTotalPrice(totalWithoutTax: Float, discount: Float, tax: Float) -> Float {
        return totalWithoutTax - discount + tax
    }
    
}
