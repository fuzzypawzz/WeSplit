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

    let billAmount = app.textFields["Bill amount"].firstMatch
    XCTAssertTrue(billAmount.waitForExistence(timeout: 5))
    billAmount.tap()
    billAmount.typeKey("a", modifierFlags: .command)
    billAmount.typeText("100")

    let doneButton = app.buttons["Done"].firstMatch
    XCTAssertTrue(doneButton.waitForExistence(timeout: 2))
    doneButton.tap()

    let peoplePicker = app.buttons["peoplePicker"].firstMatch
    XCTAssertTrue(peoplePicker.waitForExistence(timeout: 2))
    peoplePicker.tap()

    let fivePersonsOption = app.buttons["5 persons"].firstMatch
    XCTAssertTrue(fivePersonsOption.waitForExistence(timeout: 5))
    fivePersonsOption.tap()

    let tip25 = app.buttons["tip_25"].firstMatch
    XCTAssertTrue(tip25.waitForExistence(timeout: 2))
    tip25.tap()

    let currencyCode = Locale.current.currency?.identifier ?? "DKK"
    let expectedTotal = 125.0.formatted(.currency(code: currencyCode))
    let expectedPerPerson = (125.0 / 5.0).formatted(.currency(code: currencyCode))

    let totalElement = app.staticTexts["totalAmount"].firstMatch
    let perPersonElement = app.staticTexts["perPersonAmount"].firstMatch
    XCTAssertTrue(totalElement.waitForExistence(timeout: 3))
    XCTAssertTrue(perPersonElement.waitForExistence(timeout: 3))

    XCTAssertEqual(totalElement.label, expectedTotal, "Total mismatch")
    XCTAssertEqual(perPersonElement.label, expectedPerPerson, "Per person mismatch")
  }
}
