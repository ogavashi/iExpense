//
//  AddView.swift
//  iExpense
//
//  Created by Oleg Gavashi on 08.09.2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type: ExpenseType = ExpenseType.personal
    @State private var amount = 0.0
    
    var currency: String
    
    var body: some View {
        NavigationView {
            Form {
                Section("Details") {
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $type) {
                        ForEach(ExpenseType.allCases) { option in
                            Text(String(describing: option))
                        }
                    }
                }
                Section("Amount") {
                    TextField("Amount", value: $amount, format: .currency(code: currency))
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Add expense")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel"){
                        cancelAdding()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save"){
                        addExpense()
                    }
                    .disabled(name == "" || amount == 0.0)
                }
            }
        }
    }
    
    func cancelAdding() {
        name = ""
        type = ExpenseType.personal
        amount = 0.0
        dismiss()
    }
    
    func addExpense() {
        let newItem = ExpenseItem(name: name, type: type, amount: amount)
        expenses.items.append(newItem)
        dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses(), currency: "USD")
    }
}
