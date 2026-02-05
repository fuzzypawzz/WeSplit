//
//  WeSplitTests.swift
//  WeSplitTests
//
//  Created by Jannik Maag on 30/11/2025.
//

import Testing
@testable import WeSplit

struct WeSplitTests {

    @MainActor
    @Test func calculatesGrandTotalAndAmountToPay() {
        let vm = ContentViewModel()

        #expect(vm.checkAmount == 0)
        #expect(vm.numberOfPeople == 2)
        #expect(vm.tipPercent == 20)

        vm.checkAmount = 100
        vm.numberOfPeople = 3  // actual people = 3 + initial value (2) = 5
        vm.tipPercent = 25

        #expect(vm.grandTotal == 125.0)
        #expect(vm.amountEachPersonHasToPay == 25.0)
    }

    @MainActor
    @Test func isClearButtonShownReflectsCheckAmount() {
        let vm = ContentViewModel()

        #expect(vm.isClearButtonShown == false)

        vm.checkAmount = 50
        #expect(vm.isClearButtonShown == true)

        vm.clearCheckAmount()
        #expect(vm.isClearButtonShown == false)
    }

    @MainActor
    @Test func zeroCheckAmountProducesZeroTotals() {
        let vm = ContentViewModel()

        #expect(vm.grandTotal == 0.0)
        #expect(vm.amountEachPersonHasToPay == 0.0)
    }

    @MainActor
    @Test func verySmallCheckAmount() {
        let vm = ContentViewModel()

        vm.checkAmount = 0.01
        #expect(vm.grandTotal == 0.012)
        #expect(vm.amountEachPersonHasToPay == 0.003)
    }

    @MainActor
    @Test func largeCheckAmountToMakeSureAppDoesNotBreak() {
        let vm = ContentViewModel()

        vm.checkAmount = 999_999.99
        #expect(vm.grandTotal == 1_199_999.988)
        #expect(vm.amountEachPersonHasToPay == 299_999.997)
    }

    @MainActor
    @Test func clearCheckAmountResetsValues() {
        let vm = ContentViewModel()

        vm.checkAmount = 100
        vm.tipPercent = 25

        vm.clearCheckAmount()

        #expect(vm.checkAmount == 0.0)
        #expect(vm.grandTotal == 0.0)
        #expect(vm.amountEachPersonHasToPay == 0.0)
    }

}
