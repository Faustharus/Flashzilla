//
//  ContentView.swift
//  Flashzilla
//
//  Created by Damien Chailloleau on 27/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { item in
                        CardView(card: cards[item])
                            .stacked(at: item, in: cards.count)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
