//
//  CoinDetail.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

struct CoinDetail: Codable {
    let id, symbol, name: String?
    let blockTimeInMinutes: Int?
    let hashingAlgorithm: String?
    let description: Description?
    let links: Links?
}

extension CoinDetail: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

extension CoinDetail: Equatable {
    static func == (lhs: CoinDetail, rhs: CoinDetail) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    static func == (lhs: Coin, rhs: CoinDetail) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

struct Links: Codable {
    let homepage: [String]?
    let subredditURL: String?
}

struct Description: Codable {
    let en: String?
}
