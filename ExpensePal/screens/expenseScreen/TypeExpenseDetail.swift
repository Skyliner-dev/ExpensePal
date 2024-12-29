//
//  TypeExpenseDetail.swift
//  ExpensePal
//
//  Created by Raghul A on 29/12/24.
//

import SwiftUI
import SwiftData

struct TypeExpenseDetail: View {
    @Bindable var typeexpense: TypeExpense
    @State var newExpense: Expense?
    @Environment(\.modelContext) private var context
    @State var totalCost: Double = 0
    var body: some View {
            Form {
                Section("Change the name by your liking") {
                    TextField("Name", text: $typeexpense.name)
                        .autocorrectionDisabled()
                }
                Section("Total Spent on \(typeexpense.name)") {
                    Text("\(Locale.current.currencySymbol ?? "$") \(String(format:"%.2f" , totalCost))")
                }
                
                Section("Expenses") {
                    List {
                        if !typeexpense.expenses.isEmpty {
                            ForEach(typeexpense.expenses) {
                                expense in
                                Text(expense.name)
                            }
                        } else {
                            Text("Add an expense")
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .navigationTitle(typeexpense.emoji)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add an expense",systemImage: "plus") {
                            addExpense()
                        }
                    }
                }
            .sheet(item: $newExpense) {
                exp in
                NavigationStack {
                    ExpenseDetail(typeExpense: typeexpense,expense: exp, callback: {
                        totalSum()
                    })
                }
            }
            .onAppear {
                totalSum()
            }
        }
    func totalSum() {
        var sum: Double = 0
        for cost in typeexpense.expenses {
            sum += cost.cost ?? 0
        }
        totalCost = sum
    }
    func addExpense() {
        let newExpense = Expense(name: "")
        context.insert(newExpense)
        self.newExpense = newExpense
    
    }

}

#Preview {
    NavigationStack {
        TypeExpenseDetail(typeexpense: SampleData.shared.expense)
    }
}
