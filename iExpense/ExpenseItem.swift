//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Oleg Gavashi on 08.09.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Equatable, Codable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}
