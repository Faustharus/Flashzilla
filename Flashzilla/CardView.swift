//
//  CardView.swift
//  Flashzilla
//
//  Created by Damien Chailloleau on 29/07/2024.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    @State private var isAnswerVisible: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.white.shadow(.drop(radius: 10)))
            
            VStack {
                Text("\(card.prompt)")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                
                if isAnswerVisible {
                    Text("\(card.answer)")
                        .font(.title)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 200)
        .onTapGesture {
            withAnimation(.easeIn) {
                isAnswerVisible.toggle()
            }
        }
    }
}

#Preview {
    CardView(card: .example)
}
