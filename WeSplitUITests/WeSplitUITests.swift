//
//  WeSplitUITests.swift
//  WeSplitUITests
//
//  Created by Jannik Maag on 30/11/2025.
//

import XCTest

final class WeSplitUITests: XCTestCase {
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
    
  @MainActor
  func testCanSplitABill() throws {
    let app = XCUIApplication()
    app.launch()
    // let billAmount = app/*@START_MENU_TOKEN@*/.textFields["Bill amount"]/*[[".otherElements",".textFields[\"0,00 kr.\"]",".textFields[\"Bill amount\"]",".textFields"],[[[-1,2],[-1,1],[-1,3],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch
    // billAmount.doubleTap()
    // billAmount.typeKey("a", modifierFlags:.command)
    // app/*@START_MENU_TOKEN@*/.textFields["Bill amount"]/*[[".otherElements",".textFields[\"100\"]",".textFields[\"Bill amount\"]",".textFields"],[[[-1,2],[-1,1],[-1,3],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("100")
    // app/*@START_MENU_TOKEN@*/.staticTexts["4 persons"]/*[[".buttons",".staticTexts",".staticTexts[\"4 persons\"]"],[[[-1,2],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
    // app/*@START_MENU_TOKEN@*/.buttons["7 persons"]/*[[".cells.buttons[\"7 persons\"]",".buttons[\"7 persons\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
    // app/*@START_MENU_TOKEN@*/.buttons["25 %"]/*[[".segmentedControls.buttons[\"25 %\"]",".buttons[\"25 %\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
    // XCTAssertTrue(app.staticTexts["125,00 kr."].firstMatch.exists)
    // XCTAssertTrue(app/*@START_MENU_TOKEN@*/.staticTexts["17,86 kr."]/*[[".otherElements.staticTexts[\"17,86 kr.\"]",".staticTexts[\"17,86 kr.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.exists)
  }
}
