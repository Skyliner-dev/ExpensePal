//
//  ProfileView.swift
//  ExpensePal
//
//  Created by Raghul A on 29/12/24.
//

import SwiftUI
import SwiftData


struct ProfileView: View {
    @Query(sort: \TypeExpense.name) private var typeExpenses: [TypeExpense]
    @State private var totalCost: Double = 0
    @State private var costOrder: [String: Double] = [:]
    var body: some View {
        List {
            Section("Total Money Spent") {
                HStack {
                    Text("Total Spent")
                    Spacer()
                    Text("\(String(format:"%.2f",totalCost))")
                }
                .font(.largeTitle)
            }
            Section(header: Text("Ranking")) {
                if !costOrder.isEmpty {
                    ForEach(costOrder.sorted(by: { $0.value < $1.value }), id: \.key) { (key, value) in
                        HStack {
                            Text("\(key)")
                            Spacer()
                            Text(
                                "\(Locale.current.currencySymbol ?? "USD")"+" \(String(format: "%.2f",value))"
                            )
                        }
                    }
                } else {
                    Text("Empty List")
                }
            }
        }
        .onAppear {
            assignOrder()
            var sums: Double = 0
            for types in typeExpenses {
                for expense in types.expenses {
                    sums += expense.cost ?? 0
                }
            }
            totalCost = sums
        }
    }
    func assignOrder() {
        for type in typeExpenses {
            var sum: Double = 0
            for expense in type.expenses {
                sum += expense.cost ?? 0
            }
            costOrder[type.name] = sum
        }
    }
}

#Preview {
    ProfileView()
        .modelContainer(SampleData.shared.modelContainer)
}
