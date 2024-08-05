//
//  EditCards.swift
//  Flashzilla
//
//  Created by Damien Chailloleau on 30/07/2024.
//

import SwiftUI

struct EditCards: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var cards = DataManager.loadData()
    @State private var newPrompt: String = ""
    @State private var newAnswer: String = ""
    @State private var isTrueOrNot: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add New Card") {
                    TextField("Prompt", text: $newPrompt)
                        .keyboardType(.default)
                    TextField("Answer", text: $newAnswer)
                        .keyboardType(.default)
                    Toggle(isOn: $isTrueOrNot) {
                        Text("The Answer is: \(isTrueOrNot.description.capitalized)")
                    }
                    HStack {
                        Button {
                            addCard()
                        } label: {
                            Text("Add Card")
                                .foregroundStyle(.blue)
                        }
                        .buttonStyle(.plain)
                        Spacer()
                        Button {
                            resetTexts()
                        } label: {
                            Text("Reset All")
                                .foregroundStyle(.red)
                        }
                        .buttonStyle(.plain)
                    }
                }
                
                Section {
                    ForEach(0 ..< cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
        }
    }
}

#Preview {
    EditCards()
}

// MARK: Functions & Computed Properties
extension EditCards {
    
    func addCard() { 
        let trimmedPrompts = newPrompt.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedAnswers = newAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedTruth = isTrueOrNot
        guard trimmedPrompts.isEmpty == false && trimmedAnswers.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompts, answer: trimmedAnswers, isAnswerTrue: trimmedTruth)
        cards.insert(card, at: 0)
        DataManager.saveData(cards)
        resetTexts()
    }
    
    func resetTexts() { 
        self.newPrompt = ""
        self.newAnswer = ""
        self.isTrueOrNot = false
    }
    
    func removeCards(at offsets: IndexSet) { 
        cards.remove(atOffsets: offsets)
        DataManager.saveData(cards)
    }
    
    func done() { 
        dismiss()
    }
}
