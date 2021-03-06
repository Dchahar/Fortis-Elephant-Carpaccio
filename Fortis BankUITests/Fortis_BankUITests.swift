//
//  Fortis_BankUITests.swift
//  Fortis BankUITests
//
//  Created by Dheeraj Chahar on 16/04/19.
//  Copyright © 2019 Tata Consultancy Services. All rights reserved.
//

import XCTest

class Fortis_BankUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        let addButton = app.navigationBars["Fortis Bank"].buttons["Add"]
        addButton.tap()
        
        let labelOfItemTextField = app.textFields["Label of item"]
        labelOfItemTextField.tap()
        
        let quantityTextField = app.textFields["Quantity"]
        quantityTextField.tap()
        quantityTextField.tap()
        
        let priceTextField = app.textFields["Price"]
        priceTextField.tap()
        priceTextField.tap()
        
        let doneButton = app.buttons["Done"]
        doneButton.tap()
        addButton.tap()
        labelOfItemTextField.tap()
        quantityTextField.tap()
        quantityTextField.tap()
        priceTextField.tap()
        priceTextField.tap()
        
        let ut685PickerWheel = app/*@START_MENU_TOKEN@*/.pickerWheels["UT: 6.85%"]/*[[".pickers.pickerWheels[\"UT: 6.85%\"]",".pickerWheels[\"UT: 6.85%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        ut685PickerWheel.swipeUp()
        doneButton.tap()
        addButton.tap()
        labelOfItemTextField.tap()
        quantityTextField.tap()
        quantityTextField.tap()
        quantityTextField.tap()
        priceTextField.tap()
        priceTextField.tap()
        ut685PickerWheel/*@START_MENU_TOKEN@*/.press(forDuration: 1.6);/*[[".tap()",".press(forDuration: 1.6);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        doneButton.tap()
    }
}
