//
//  ItemsInputViewControllerSpec.swift
//  Fortis BankTests
//
//  Created by Dheeraj Chahar on 16/04/19.
//  Copyright © 2019 Tata Consultancy Services. All rights reserved.
//

import Quick
import Nimble

@testable import Fortis_Bank

class ItemsInputViewControllerSpec: QuickSpec {
    override func spec() {
        var subject: ItemsInputViewController!
        
        context("when view is loaded") {
            beforeEach() {
                subject = UIStoryboard(name: "Main", bundle:
                    nil).instantiateViewController(withIdentifier:
                        "ItemsInputViewController") as? ItemsInputViewController
                _ = subject.view
            }
            it("when the view loaded") {
                expect(subject.navigationItem.title).to(equal("Billing Details"))
            }
        }
    }
}
