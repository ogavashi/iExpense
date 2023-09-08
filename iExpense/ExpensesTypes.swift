//
//  ExpensesTypes.swift
//  iExpense
//
//  Created by Oleg Gavashi on 08.09.2023.
//

import Foundation

enum ExpenseType: CaseIterable, Identifiable, CustomStringConvertible, Codable {
    case personal
    case business
    
    var id: Self { self }
    
    var description: String {
        
        switch self {
        case .personal:
            return "Personal"
        case .business:
            return "Business"
        }
    }
}
