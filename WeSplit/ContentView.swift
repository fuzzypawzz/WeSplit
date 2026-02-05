//
//  ContentView.swift
//  WeSplit
//
//  Created by Jannik Maag on 30/11/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var vm = ContentViewModel()
  @FocusState private var amountIsFocused: Bool

  var body: some View {
    NavigationStack {
      Form {
        Section {
          HStack {
            TextField(
              vm.contentFor["AmountLabel", default: "Amount"],
              value: $vm.checkAmount,
              format: .currency(code: vm.currencyCode)
            )
            .keyboardType(.decimalPad)
            .focused($amountIsFocused)
            
            if vm.isClearButtonShown {
              Button(action: vm.clearCheckAmount) {
                Image(systemName: "xmark.circle.fill")
                  .foregroundColor(.red)
              }
              .buttonStyle(.automatic)
            }
          }
          
          Picker(
            vm.contentFor["PeoplePickerLabel", default: "People"],
            selection: $vm.numberOfPeople
          ) {
            ForEach(2..<100) { i in
              Text("\(i) \(vm.contentFor["PeoplePickerItemLabel", default: "people"])")
            }
          }
        }
        
        Section(
          vm.contentFor["TipPercentageHeading", default: "Tip"]
        ) {
          Picker(
            vm.contentFor["TipPercentagePickerLabel", default: "Tip"],
            selection: $vm.tipPercent
          ) {
            ForEach(vm.tipPercentences, id: \.self) { percentage in
              Text(percentage, format: .percent)
            }
          }
          .pickerStyle(.segmented)
        }
        
        Section(
          vm.contentFor["TotalAmountHeading", default: "Total"]
        ) {
          Text(vm.grandTotal, format: .currency(code: vm.currencyCode))
        }
        
        Section(
          vm.contentFor["SummaryHeading", default: "Per person:"]
        ) {
          Text(vm.amountEachPersonHasToPay, format: .currency(code: vm.currencyCode))
        }
      }
      .navigationTitle(vm.appName)
      
      .navigationSubtitle(vm.contentFor["SubTitle", default: ""])
      
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
