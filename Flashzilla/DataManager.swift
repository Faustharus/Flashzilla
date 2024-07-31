//
//  DataManager.swift
//  Flashzilla
//
//  Created by Damien Chailloleau on 31/07/2024.
//

import Foundation

struct DataManager {
    static let savePath = URL.documentsDirectory.appendingPathExtension("SavedData")
    
    static func saveData(_ cards: [Card]) {
        if let data = try? JSONEncoder().encode(cards) {
            try? data.write(to: savePath, options: [.atomic, .completeFileProtection])
        }
//        if let data = try? JSONEncoder().encode(cards) {
//            UserDefaults.standard.setValue(data, forKey: "Cards")
//        }
    }
    
    static func loadData() -> [Card] {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                return decoded
            }
        }
        return []
    }
}
