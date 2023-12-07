//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Nemanja Vlahovic on 7.12.23..
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                        .animation(.none)
                        .background {
                            CircleButtonAnimationView(animate: $showPortfolio)
                        }
                    Spacer()
                    Text(showPortfolio ? "Portfolio" : "Live prices")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.theme.accent)
                        .animation(.none)
                    Spacer()
                    CircleButtonView(iconName: "chevron.right")
                        .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                        .onTapGesture {
                            withAnimation(.spring) {
                                showPortfolio.toggle()
                            }
                        }
                }
                Spacer(minLength: 0)
            }
        }

    }
}

#Preview {
    NavigationStack {
        HomeView()
            .toolbar(.hidden, for: .navigationBar)
    }
}
