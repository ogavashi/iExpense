//
//  ExpensesList.swift
//  iExpense
//
//  Created by Oleg Gavashi on 08.09.2023.
//

import SwiftUI

struct ExpensesList: View {
    
    @ObservedObject var expenses: Expenses
    var expenseType: ExpenseType
    var listName: String
    var currency: String
    
    var body: some View {
        if !getExpensesByType(type: expenseType).isEmpty {
            VStack {
                Section(listName) {
                    List {
                        ForEach(getExpensesByType(type: expenseType)) { expense in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(expense.name)
                                        .bold()
                                    Text(expense.type.description)
                                        .opacity(0.5)
                                }
                                Spacer()
                                Text(expense.amount, format: .currency(code: currency))
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteItems(item: expense)
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    func deleteItems(item: ExpenseItem) {
        var indexes = IndexSet()
        if let index = expenses.items.firstIndex(of: item) {
            indexes.insert(index)
        }
        expenses.items.remove(atOffsets: indexes)
    }
    
    func getExpensesByType(type: ExpenseType) -> [ExpenseItem] {
        return expenses.items.filter { expense in
            expense.type == type
            
        }
    }
}

struct ExpensesList_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesList(expenses: Expenses(), expenseType: ExpenseType.personal, listName: "Personal", currency: "USD")
    }
}
