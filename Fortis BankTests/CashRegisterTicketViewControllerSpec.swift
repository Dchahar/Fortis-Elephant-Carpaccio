//
//  CashRegisterTicketViewControllerSpec.swift
//  Fortis BankTests
//
//  Created by Dheeraj Chahar on 16/04/19.
//  Copyright © 2019 Tata Consultancy Services. All rights reserved.
//

import Quick
import Nimble

@testable import Fortis_Bank

class CashRegisterTicketViewControllerSpec: QuickSpec {
    override func spec() {
        var subject: CashRegisterTicketViewController!
        var cell: ComputeTicketTableViewCell!
        beforeEach() {
            subject = UIStoryboard(name: "Main", bundle:
                nil).instantiateViewController(withIdentifier:
                    "CashRegisterTicketViewController") as? CashRegisterTicketViewController
            
            let items: [ItemEntry] = [ItemEntry(itemName: "qwerty", itemQuantity: "1000", itemPrice: "100", itemTaxStateCode: "8.0")]
            subject.items = items
            _ = subject.view
            subject.loadViewIfNeeded()
        }
        
        context("loads table View") {
            it("should expect number of section") {
                expect(subject.ticketsTableView.numberOfSections).to(equal(2))
            }
            
            it("should expect number of rows") {
                expect(subject.ticketsTableView.numberOfRows(inSection: 0)).to(equal(subject.items.count + 1))
            }
        
        }
        
        context("uitableview cell") {
            beforeEach {
                subject.ticketsTableView.reloadData()
                cell = subject?.ticketsTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! ComputeTicketTableViewCell
            }
            it("tableview cell should contain movie title and genre", closure: {
                expect(cell.totalPriceLabel?.text).to(equal("93000.0"))
                expect(cell.totalTaxLabel?.text).to(equal("8000.0"))
            })
        }
    }
}
