//
//  CoinService.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

protocol CoinServiceInterface {
    var httpClient: HTTPClient { get }
    
    func fetchCoins() async throws -> [Coin]
}

struct CoinService: CoinServiceInterface {
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: Constants.Endpoints.coinGeckoTopCoinURL) else {
            throw NetworkError.badURL
        }
        
        do {
            let response: [Coin] = try await httpClient.get(url: url)
            return response
        } catch {
            return [Coin]()
        }
    }
}
