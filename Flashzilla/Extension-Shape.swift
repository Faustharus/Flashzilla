//
//  Extension-Shape.swift
//  Flashzilla
//
//  Created by Damien Chailloleau on 31/07/2024.
//

import SwiftUI

extension Shape {
    
    func dragFill(using offset: CGSize) -> some View {
        if offset.width > 0 {
            self.fill(.green)
        } else if offset.width < 0 {
            self.fill(.red)
        } else {
            self.fill(.white)
        }
    }
    
}
