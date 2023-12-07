//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by Nemanja Vlahovic on 7.12.23..
//

import SwiftUI

struct CoinRowView: View {
    let coin: Coin
    let showHoldingColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
            Spacer()
        
            if showHoldingColumn {
                VStack(alignment: .trailing) {
                    Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                        .bold()
                    Text((coin.currentHoldings ?? 0).asNumberString())
                }
                .foregroundStyle(Color.theme.accent)
            }
            
            VStack(alignment: .trailing) {
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundStyle(Color.theme.accent)
                Text(coin.priceChangePercentage24h.asPercentString())
                    .foregroundStyle(coin.priceChangePercentage24h >= 0 ? Color.theme.green : Color.theme.red)
            }
            .padding(.leading)
        }
        .font(.subheadline)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: Coin.mocked, showHoldingColumn: true)
}
