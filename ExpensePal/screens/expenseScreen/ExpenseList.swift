//
//  ExpenseList.swift
//  ExpensePal
//
//  Created by Raghul A on 29/12/24.
//

import SwiftUI
import SwiftData

struct ExpenseList: View {
    
    @Query(sort: \TypeExpense.name) private var typeExpenses: [TypeExpense]
    @State private var newTypeExpense: TypeExpense?
    @Environment(\.modelContext) private var context

    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(typeExpenses) { typeExpense in
                    NavigationLink(destination:
                        TypeExpenseDetail(typeexpense: typeExpense)
                    ) {
                        HStack {
                            Text(typeExpense.emoji)
                                .font(.largeTitle)
                                .frame(width: 50, height: 50)
                              
                            Text(typeExpense.name)
                                .font(.title2)
                        }
                      
                    }
                }
                .onDelete(perform: deleteExpense(indexes: ))
            }
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem {
                    Button("Add", systemImage: "plus") {
                        addTypeExpense()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .sheet(item: $newTypeExpense) {
                typeEx in
                NavigationStack {
                    TypeAddView(typeExpense: typeEx)
                }
            }

        } detail: {
            Text("Select an expense")
                .navigationTitle("Expenses")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    

    
    private func addTypeExpense() {
        let newTypeExpense = TypeExpense(name: "", emoji: "")
        context.insert(newTypeExpense)
        self.newTypeExpense = newTypeExpense
    }
    
    private func deleteExpense(indexes: IndexSet) {
        for index in indexes {
            context.delete(typeExpenses[index])
        }
    }
}

#Preview {
    ExpenseList()
        .modelContainer(SampleData.shared.modelContainer)
}
