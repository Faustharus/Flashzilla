//
//  TestGestureView.swift
//  Flashzilla
//
//  Created by Damien Chailloleau on 29/07/2024.
//

import SwiftUI

struct TestGestureView: View {
    //    @State private var currentAmount: Double = 0.0
    //    @State private var finalAmount: Double = 1.0
    //
    //    @State private var currentAngle: Angle = .zero
    //    @State private var finalAngle: Angle = .zero
        
        @State private var offset: CGSize = .zero
        @State private var isDragging: Bool = false
        
        var body: some View {
            let dragGesture = DragGesture()
                .onChanged { value in offset = value.translation }
                .onEnded { _ in
                    withAnimation(.spring) {
                        offset = .zero
                        isDragging = false
                    }
                }
            
            let pressGesture = LongPressGesture()
                .onEnded { value in
                    withAnimation(.spring) {
                        isDragging = true
                    }
                }
            
            let combined = pressGesture.sequenced(before: dragGesture)
            
            Circle()
                .fill(Color.red.gradient)
                .frame(width: 64, height: 64)
                .scaleEffect(isDragging ? 1.5 : 1)
                .offset(offset)
                .gesture(combined)
            
            // MARK: Simultaneous Gesture
    //        VStack {
    //            VStack {
    //                Image(systemName: "globe")
    //                    .imageScale(.large)
    //                    .foregroundStyle(.tint)
    //                Text("Hello, world!")
    //            }
    //            .rotationEffect(finalAngle + currentAngle)
    //            .gesture(
    //                RotateGesture()
    //                    .onChanged { value in
    //                        currentAngle = value.rotation
    //                    }
    //                    .onEnded { value in
    //                        finalAngle += currentAngle
    //                        currentAngle = .zero
    //                    }
    //            )
    //        }
    //        .scaleEffect(finalAmount + currentAmount)
    //        .simultaneousGesture(
    //            MagnifyGesture()
    //                .onChanged({ value in
    //                    currentAmount = value.magnification - 1
    //                })
    //                .onEnded({ value in
    //                    finalAmount += currentAmount
    //                    currentAmount = 0
    //                })
    //        )
    //        .padding()
        }
}

#Preview {
    TestGestureView()
}
