//
//  Shimmer.swift
//  PosterAssignment
//
//  Created by BELDIN Yaroslav on 10.04.2025.
//

import SwiftUI

struct Shimmer: ViewModifier {
    @Binding
    var isActive: Bool
    
    @State
    private var isInitialState = true
    
    func body(content: Content) -> some View {
        if isActive {
            content
                .redacted(reason: .placeholder)
                .foregroundColor(.gray.opacity(Constants.placeholderOpacity))
                .mask(
                    LinearGradient(
                        gradient: Constants.gradient,
                        startPoint: isInitialState ? Constants.initialStartPoint : Constants.animatedStartPoint,
                        endPoint: isInitialState ? Constants.initialEndPoint : Constants.animatedEndPoint
                    )
                )
                .onAppear {
                    isInitialState = false
                }
                .animation(
                    .linear(duration: Constants.animationDuration).repeatForever(autoreverses: false),
                    value: isInitialState
                )
        } else {
            content
                .onAppear {
                    isInitialState = true
                }
        }
    }
}

private extension Shimmer {
    enum Constants {
        static let placeholderOpacity: CGFloat = 0.8
        static let gradient = Gradient(colors: [.black.opacity(0.4), .black, .black.opacity(0.4)])
        static let animationDuration: Double = 1.5
        static let initialStartPoint = UnitPoint(x: -1, y: -1)
        static let initialEndPoint = UnitPoint(x: 0, y: 0)
        static let animatedStartPoint = UnitPoint(x: 2, y: 2)
        static let animatedEndPoint = UnitPoint(x: 3, y: 3)
    }
}

extension View {
    func shimmering(_ isActive: Binding<Bool>) -> some View {
        modifier(Shimmer(isActive: isActive))
    }
}
