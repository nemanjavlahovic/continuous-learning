//
//  CircleButtonAnimationView.swift
//  CryptoTracker
//
//  Created by Nemanja Vlahovic on 7.12.23..
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(.easeOut, value: animate)
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundStyle(.red)
        .frame(width: 100, height: 100)
}
