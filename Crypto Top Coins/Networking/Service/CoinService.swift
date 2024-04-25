//
//  CoinService.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

protocol CoinServiceInterface {
    var httpClient: HTTPClient { get }
    var cacheManager: CacheManagerInterface { get }
    
    func fetchCoins() async throws -> [Coin]
    func fetchCachedCoins() -> [Coin]
}

struct CoinService: CoinServiceInterface {
    let httpClient: HTTPClient
    let cacheManager: CacheManagerInterface
    
    init(httpClient: HTTPClient, cacheManager: CacheManagerInterface) {
        self.httpClient = httpClient
        self.cacheManager = cacheManager
    }
    
    func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: Constants.Endpoints.coinGeckoTopCoinEndpoint) else {
            throw NetworkError.badURL
        }
        
        do {
            let response: [Coin] = try await httpClient.get(url: url)
            cacheManager.saveCache(coins: response)
            return response
        } catch {
            return fetchCachedCoins()
        }
    }
    
    func fetchCachedCoins() -> [Coin] {
        return cacheManager.retrieveCache()
    }
}
