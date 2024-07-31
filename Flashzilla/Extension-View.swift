//
//  Extension-View.swift
//  Flashzilla
//
//  Created by Damien Chailloleau on 29/07/2024.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
    
//    RoundedRectangle(cornerRadius: 25)
//        .fill(offset.width > 0 ? .green : .red)
}
