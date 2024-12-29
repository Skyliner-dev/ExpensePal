//
//  TypeAddView.swift
//  ExpensePal
//
//  Created by Raghul A on 29/12/24.
//

import SwiftUI

struct TypeAddView: View {
    @Bindable var typeExpense: TypeExpense
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Form {
            Section("Name you like") {
                TextField("Name", text: $typeExpense.name)
            }
            Section(
                "Emoji of your choice"
            ) {
                TextField("Emoji", text: $typeExpense.emoji)
            }
            
        }
        .navigationTitle("Add Tracker")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    context.delete(typeExpense)
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        TypeAddView(typeExpense: SampleData.shared.expense)
    }
}
