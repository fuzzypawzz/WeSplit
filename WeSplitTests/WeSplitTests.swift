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

}
