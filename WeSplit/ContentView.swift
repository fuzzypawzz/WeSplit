//
//  ContentView.swift
//  WeSplit
//
//  Created by Jannik Maag on 30/11/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPercent = 20
  @FocusState private var amountIsFocused: Bool
  
  private struct AppData {
    static var appName = "WeSplit 💳"
  }
  
  private let tipPercentences = [10, 15, 20, 25, 0]
  
  private let contentFor = [
    "SubTitle": "Split the bill between your friends.",
    "AmountLabel": "Bill amount",
    "PeoplePickerLabel": "Split between",
    "PeoplePickerItemLabel": "persons",
    "TipPercentageHeading": "Did you leave a tip?",
    "TipPercentagePickerLabel": "Tip percentage",
    "TotalAmountHeading": "Total paid:",
    "SummaryHeading": "Each person should pay:"
  ]
  
  private let currencyCode = Locale.current.currency?.identifier ?? "DKK"
  
  private var grandTotal: Double {
    let selectedTip = Double(tipPercent)
    let tipValue = checkAmount / 100 * selectedTip
    
    return checkAmount + tipValue
  }
  
  private var isClearButtonShown: Bool {
    checkAmount != 0.0
  }
  
  private func clearCheckAmount() {
    checkAmount = 0.0
  }
  
  private var amountEachPersonHasToPay: Double {
    // the picker list starts from 2
    let peopleCount = Double(numberOfPeople + 2)
    
    return grandTotal / peopleCount
  }
  
  var body: some View {
    NavigationStack {
      Form {
        Section {
          HStack {
            TextField(
              contentFor["AmountLabel", default: "Amount"],
              value: $checkAmount,
              format: .currency(code: currencyCode)
            )
            .keyboardType(.decimalPad)
            .focused($amountIsFocused)
            
            if isClearButtonShown {
              Button(action: clearCheckAmount) {
                Image(systemName: "xmark.circle.fill")
                  .foregroundColor(.red)
              }
              .buttonStyle(.automatic)
            }
          }
          
          Picker(
            contentFor["PeoplePickerLabel", default: "People"],
            selection: $numberOfPeople
          ) {
            ForEach(2..<100) { i in
              Text("\(i) \(contentFor["PeoplePickerItemLabel", default: "people"])")
            }
          }
        }
        
        Section(
          contentFor["TipPercentageHeading", default: "Tip"]
        ) {
          Picker(
            contentFor["TipPercentagePickerLabel", default: "Tip"],
            selection: $tipPercent
          ) {
            ForEach(tipPercentences, id: \.self) { percentage in
              Text(percentage, format: .percent)
            }
          }
          .pickerStyle(.segmented)
        }
        
        Section(
          contentFor["TotalAmountHeading", default: "Total"]
        ) {
          Text(grandTotal, format: .currency(code: currencyCode))
        }
        
        Section(
          contentFor["SummaryHeading", default: "Per person:"]
        ) {
          Text(amountEachPersonHasToPay, format: .currency(code: currencyCode))
        }
      }
      .navigationTitle(AppData.appName)
      
      .navigationSubtitle(contentFor["SubTitle", default: ""])
      
      .toolbar {
        if amountIsFocused {
          Button("Done") {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
