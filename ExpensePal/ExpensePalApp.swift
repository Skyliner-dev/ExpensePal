//
//  ExpensePalApp.swift
//  ExpensePal
//
//  Created by Raghul A on 29/12/24.
//

import SwiftUI
import SwiftData

@main
struct ExpensePalApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [TypeExpense.self, Expense.self])
    }
}
