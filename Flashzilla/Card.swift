//
//  Card.swift
//  Flashzilla
//
//  Created by Damien Chailloleau on 29/07/2024.
//

import Foundation

struct Card: Identifiable, Codable, Hashable, Equatable {
    var id = UUID()
    var prompt: String
    var answer: String
    var isAnswerTrue: Bool
    
    #if DEBUG
    static let example: Card = .init(prompt: "Whom's the actor who interpreted Iron Man/Tony Stark", answer: "Robert Downey Junior", isAnswerTrue: true)
    #endif
}
