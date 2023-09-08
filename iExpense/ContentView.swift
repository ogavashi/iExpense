//
//  ContentView.swift
//  iExpense
//
//  Created by Oleg Gavashi on 08.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showAddView = false
    
    private var userCurrency = Locale.current.currency?.identifier ?? "UAH"
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if expenses.items.isEmpty {
                        Text("No expenses yet")
                            .bold()
                            .font(.title)
                    }
                    ExpensesList(expenses: expenses, expenseType: ExpenseType.personal, listName: "Personal", currency: userCurrency)
                    ExpensesList(expenses: expenses, expenseType: ExpenseType.business, listName: "Business", currency: userCurrency)
                    
                }
                .navigationTitle("iExpense")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            showAdd()
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                    }
                }
                .sheet(isPresented: $showAddView) {
                    AddView(expenses: expenses, currency: userCurrency)
                }
            }
        }
    }
    
    func showAdd() {
        showAddView = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
