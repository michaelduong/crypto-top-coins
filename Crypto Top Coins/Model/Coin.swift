//
//  Coin.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

enum CoinIdentifier {
    case coin(Coin)
    case id(String)
}

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
    let priceChangePercentage24HInCurrency: Double?
    var coinDetail: CoinDetail?
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
    
    static func == (lhs: Coin, rhs: CoinDetail) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()
