//
//  CashRegisterTicketViewController.swift
//  Fortis Bank
//
//  Created by Dheeraj Chahar on 16/04/19.
//  Copyright © 2019 Tata Consultancy Services. All rights reserved.
//

import UIKit

class CashRegisterTicketViewController: UIViewController {
    
    var newItem: ItemEntry?
    var items = [ItemEntry]()
    
    @IBOutlet weak var ticketsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func done(segue: UIStoryboardSegue) {
        
        if let item = newItem {
            items.append(item)
        }
        ticketsTableView.reloadData()
    }

}

// MARK: - Delegate Methods
extension CashRegisterTicketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return items.count + 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemsTableViewCell.identifier, for: indexPath) as? ItemsTableViewCell else {
                    fatalError("Couldn't instantiate Items Table View Cell")
                }
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemsTableViewCell.identifier, for: indexPath) as? ItemsTableViewCell else {
                    fatalError("Couldn't instantiate Items Table View Cell")
                }
                cell.configure(itemAdded: items[indexPath.row - 1])
                return cell
            }
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ComputeTicketTableViewCell.identifier, for: indexPath) as? ComputeTicketTableViewCell else {
                fatalError("Couldn't instantiate Compute Ticket Table View Cell")
            }
            cell.calculateTicket(items: items)
            return cell
        }
    }
}
