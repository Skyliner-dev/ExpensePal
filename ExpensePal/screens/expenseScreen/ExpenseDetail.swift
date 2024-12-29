//
//  ExpenseDetail.swift
//  ExpensePal
//
//  Created by Raghul A on 29/12/24.
//

import SwiftUI

struct ExpenseDetail: View {
    @Bindable var typeExpense: TypeExpense
    @Bindable var expense: Expense
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    var callback: () -> Void
    var body: some View {
        
        Form {
            Section("Name of the expense") {
                TextField("Name", text: $expense.name)
                    .autocorrectionDisabled()
            }
            Section("Info") {
                TextField("Cost", value: $expense.cost, format: .number).keyboardType(.decimalPad)

            }
            
        }
        .navigationTitle("Add expense")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    context.insert(expense)
                    typeExpense.expenses.append(expense)
                    dismiss()
                    callback()
                }
                .disabled(expense.cost == nil && expense.name == "")
                
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    context.delete(expense)
                    dismiss()
                    callback()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ExpenseDetail(typeExpense: SampleData.shared.expense,expense: Expense(name: "Lmao"), callback: {})
    }
}
