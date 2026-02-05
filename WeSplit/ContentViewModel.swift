//
//  ContentViewModel.swift
//  WeSplit
//
//  Created by Jannik Maag on 23/12/2025.
//
import SwiftUI

@Observable
class ContentViewModel {
  var checkAmount = 0.0
  var numberOfPeople = 2
  var tipPercent = 20
  
  struct AppData {
    static var appName = "WeSplit 💳"
  }
  
  var appName = AppData.appName
  
  let tipPercentences = [10, 15, 20, 25, 0]
  
  let contentFor = [
    "SubTitle": "Split the bill between your friends.",
    "AmountLabel": "Bill amount",
    "PeoplePickerLabel": "Split between",
    "PeoplePickerItemLabel": "persons",
    "TipPercentageHeading": "Did you leave a tip?",
    "TipPercentagePickerLabel": "Tip percentage",
    "TotalAmountHeading": "Total paid:",
    "SummaryHeading": "Each person should pay:"
  ]
  
  let currencyCode = Locale.current.currency?.identifier ?? "DKK"
  
  var grandTotal: Double {
    let selectedTip = Double(tipPercent)
    let tipValue = checkAmount / 100 * selectedTip
    
    return checkAmount + tipValue
  }
  
  var isClearButtonShown: Bool {
    checkAmount != 0.0
  }
  
  func clearCheckAmount() {
    checkAmount = 0.0
  }
  
  var amountEachPersonHasToPay: Double {
    // the picker list starts from 2
    let peopleCount = Double(numberOfPeople + 2)
    
    return grandTotal / peopleCount
  }
}
