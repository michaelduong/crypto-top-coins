//
//  Coin.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id, symbol, name: String
    let image: String
    let currentPrice : Double
    let marketCapRank : Int
    let marketCap, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
}

extension Coin: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

extension Coin: Equatable {
    static func == (lhs: Coin, rhs: Coin) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]
}

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()
