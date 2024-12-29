//
//  SampleData.swift
//  ExpensePal
//
//  Created by Raghul A on 29/12/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    //for sample in typeExpenseDetail view
    var expense: TypeExpense {
        TypeExpense.sampleData.first!
    }
//    var singleExpense: Expense {
//        TypeExpense.sampleData.first!.expenses.first!
//    }
    
    private init() {
        let schema = Schema([
            TypeExpense.self, Expense.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
            
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
        
    }
    private func insertSampleData() {
        for typeExpense in TypeExpense.sampleData {
            context.insert(typeExpense)
        }
    }
}
