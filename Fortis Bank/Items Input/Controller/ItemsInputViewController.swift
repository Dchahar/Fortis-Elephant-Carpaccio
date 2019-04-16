//
//  ItemsInputViewController.swift
//  Fortis Bank
//
//  Created by Dheeraj Chahar on 16/04/19.
//  Copyright © 2019 Tata Consultancy Services. All rights reserved.
//

import UIKit

class ItemsInputViewController: UIViewController {
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemQuantityTextField: UITextField!
    @IBOutlet weak var itemPriceTextField: UITextField!
    @IBOutlet weak var itemTaxTextField: UITextField!
    
    @IBOutlet weak var itemTaxPicker: UIPickerView!
    
    private var itemTaxPickerData: [[String: AnyObject]] = []
    var itemData: ItemEntry?
    var taxRate: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Billing Details"
        // Do any additional setup after loading the view.
        
        parseStateTax()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destination = segue.destination
        if let viewController = destination as? CashRegisterTicketViewController {
            viewController.newItem = itemData
        }
    }
    
    // MARK: IBAction Methods
    @IBAction func CancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DoneEntry(_ sender: Any) {
        if let itemTax = itemTaxTextField.text, itemTax.isEmpty {
            debugPrint("Tax empty")
        }  else {
            saveItemData(tax: taxRate)
        }
    }
}

extension ItemsInputViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemTaxPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let item = itemTaxPickerData[row]
        
        if let state = item["State"] as? String, let tax = item["Tax"] as? String {
            return "\(state): \(tax)%"
        }
        
        return String()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let item = itemTaxPickerData[row]
        if let state = item["State"] as? String, let tax = item["Tax"] as? String {
            taxRate = Float(tax)
            itemTaxTextField.text = "\(state): \(tax)%"
        }
    }
}

// MARK: - Private Methods
private extension ItemsInputViewController {
    
    func parseStateTax() {
        if let path = Bundle.main.path(forResource: "StateTaxRate", ofType: "plist") {
            let items = NSArray(contentsOfFile: path) as! [[String : AnyObject]]
            itemTaxPickerData = items
            itemTaxPicker.reloadAllComponents()
        }
    }
    
    func saveIemData(item: ItemEntry) {
        itemData = ItemEntry(itemName: item.itemName, itemQuantity: item.itemQuantity, itemPrice: item.itemPrice, itemTaxStateCode: item.itemTaxStateCode)
        
    }
    
    func saveItemData(tax: Float?) {
        if let itemName = itemNameTextField.text, let itemQuantity = itemQuantityTextField.text, let itemPrice = itemPriceTextField.text, let itemTax = itemTaxTextField.text{
            if itemName.isEmpty || itemQuantity.isEmpty || itemPrice.isEmpty || itemTax.isEmpty {
                debugPrint("All text fields are not filled")
            } else {
                itemData = ItemEntry(itemName: itemName, itemQuantity: itemQuantity, itemPrice: itemPrice, itemTaxStateCode: String(tax!))
            }
            
        }
    }
}
