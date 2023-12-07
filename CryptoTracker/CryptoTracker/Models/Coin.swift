//
//  Coin.swift
//  CryptoTracker
//
//  Created by Nemanja Vlahovic on 7.12.23..
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double
    let marketCapRank: Int?
    let fullyDilutedValuation: Double
    let totalVolume: Double
    let high24h: Double
    let low24h: Double
    let priceChange24h: Double
    let priceChangePercentage24h: Double
    let marketCapChange24h: Double
    let marketCapChangePercentage24h: Double
    let circulatingSupply: Double
    let totalSupply: Double
    let maxSupply: Double
    let ath: Double
    let athChangePercentage: Double
    let athDate: String
    let atl: Double
    let atlChangePercentage: Double
    let atlDate: String
    let roi: Double?
    let lastUpdated: String
    let sparklineIn7d: Sparkline
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChange24h = "price_change_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case marketCapChange24h = "market_cap_change_24h"
        case marketCapChangePercentage24h = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath, athChangePercentage, athDate
        case atl, atlChangePercentage, atlDate
        case roi
        case lastUpdated = "last_updated"
        case sparklineIn7d = "sparkline_in_7d"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> Coin {
        return Coin(
            id: id,
            symbol: symbol,
            name: name,
            image: image,
            currentPrice: currentPrice,
            marketCap: marketCap,
            marketCapRank: marketCapRank,
            fullyDilutedValuation: fullyDilutedValuation,
            totalVolume: totalVolume,
            high24h: high24h,
            low24h: low24h,
            priceChange24h: priceChange24h,
            priceChangePercentage24h: priceChangePercentage24h,
            marketCapChange24h: marketCapChange24h,
            marketCapChangePercentage24h: marketCapChangePercentage24h,
            circulatingSupply: circulatingSupply,
            totalSupply: totalSupply,
            maxSupply: maxSupply,
            ath: ath,
            athChangePercentage: athChangePercentage,
            athDate: athDate,
            atl: atl,
            atlChangePercentage: atlChangePercentage,
            atlDate: atlDate,
            roi: roi,
            lastUpdated: lastUpdated,
            sparklineIn7d: sparklineIn7d,
            currentHoldings: amount
        )
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }

}

struct Sparkline: Codable {
    let price: [Double]
}

extension Coin {
    static var mocked: Coin {
        return Coin(
            id: "randomCoinID",
            symbol: "rnd",
            name: "RandomCoin",
            image: "https://example.com/randomcoin.png",
            currentPrice: Double.random(in: 1...1000),
            marketCap: Double.random(in: 1000000...1000000000),
            marketCapRank: Int.random(in: 1...100),
            fullyDilutedValuation: Double.random(in: 1000000000...10000000000),
            totalVolume: Double.random(in: 10000000...100000000),
            high24h: Double.random(in: 1...1000),
            low24h: Double.random(in: 1...1000),
            priceChange24h: Double.random(in: -1000...1000),
            priceChangePercentage24h: Double.random(in: -10...10),
            marketCapChange24h: Double.random(in: -1000000000...1000000000),
            marketCapChangePercentage24h: Double.random(in: -10...10),
            circulatingSupply: Double.random(in: 100000...10000000),
            totalSupply: Double.random(in: 100000...10000000),
            maxSupply: Double.random(in: 100000...10000000),
            ath: Double.random(in: 1...10000),
            athChangePercentage: Double.random(in: -100...100),
            athDate: "2023-12-07T16:28:23.426Z",
            atl: Double.random(in: 1...10),
            atlChangePercentage: Double.random(in: -100...100),
            atlDate: "2023-12-07T16:28:23.426Z",
            roi: nil,
            lastUpdated: "2023-12-07T16:28:23.426Z",
            sparklineIn7d: Sparkline(
                price: (0..<100).map { _ in Double.random(in: 1...1000) }
            ),
            currentHoldings: 0
        )

    }
}
