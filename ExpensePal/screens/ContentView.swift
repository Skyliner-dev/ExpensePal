//
//  ContentView.swift
//  ExpensePal
//
//  Created by Raghul A on 29/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {


    var body: some View {
        TabView {
            Tab("Expenses", systemImage: "wallet.bifold") {
                ExpenseList()
            }
            Tab("Profile", systemImage: "person.fill") {
                ProfileView()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
