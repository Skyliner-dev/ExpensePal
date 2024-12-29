//
//  Expense.swift
//  ExpensePal
//
//  Created by Raghul A on 29/12/24.
//

import Foundation
import SwiftData

@Model
class Expense {
    var name: String
    var cost: Double?
    var date: Date
    
    init(name: String, cost: Double? = nil, date: Date = Date()) {
        self.name = name
        self.cost = cost
        self.date = date
    }
}
