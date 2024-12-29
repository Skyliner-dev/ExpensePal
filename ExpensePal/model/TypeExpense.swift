//
//  TypeExpense.swift
//  ExpensePal
//
//  Created by Raghul A on 29/12/24.
//

import Foundation
import SwiftData

@Model
class TypeExpense {
    var name:String
    var emoji:String
    var expenses:[Expense]
    
    
    init(name: String,emoji: String ,expenses: [Expense] = []) {
        self.name = name
        self.emoji = emoji
        self.expenses = expenses
    }
    
    static let sampleData = [
        TypeExpense(name: "Food", emoji: "🍟"),
        TypeExpense(name: "Transportation", emoji: "🚋"),
        TypeExpense(name: "Housing", emoji: "🏡"),
        TypeExpense(name: "Entertainment", emoji: "🎮")
    ]
    
    
}

