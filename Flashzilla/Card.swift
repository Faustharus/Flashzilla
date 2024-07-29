//
//  Card.swift
//  Flashzilla
//
//  Created by Damien Chailloleau on 29/07/2024.
//

import Foundation

struct Card {
    var prompt: String
    var answer: String
    
    #if DEBUG
    static let example: Card = .init(prompt: "Whom's the actor who interpreted Iron Man/Tony Stark", answer: "Robert Downey Junior")
    #endif
}
