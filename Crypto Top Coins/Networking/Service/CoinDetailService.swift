//
//  CoinDetailService.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/24/24.
//

import Foundation

protocol CoinDetailServiceInterface {
    var httpClient: HTTPClient { get }
    var cacheManager: CacheManagerInterface { get }
    
    func fetchCoinDetails() async throws -> CoinDetail?
    func fetchCachedCoinDetails() -> CoinDetail?
}

struct CoinDetailService: CoinDetailServiceInterface {
    let httpClient: HTTPClient
    let cacheManager: CacheManagerInterface
    let coinId: String
    
    init(httpClient: HTTPClient, cacheManager: CacheManagerInterface, coinId: String) {
        self.httpClient = httpClient
        self.cacheManager = cacheManager
        self.coinId = coinId
    }
    
    func fetchCoinDetails() async throws -> CoinDetail? {
        guard let url = URL(string: Constants.Endpoints.coinGeckoCoinDetailURL(coinId: coinId)) else {
            throw NetworkError.badURL
        }
        
        do {
            let response: CoinDetail = try await httpClient.get(url: url)
            cacheManager.updateCache(for: .id(coinId), withDetails: response)
            return response
        } catch {
            if let cachedCoinDetails = fetchCachedCoinDetails() {
                return cachedCoinDetails
            } else {
                throw NetworkError.invalidJSON
            }
        }
    }
    
    func fetchCachedCoinDetails() -> CoinDetail? {
        let coin = cacheManager.findCoin(by: coinId)
        return coin?.coinDetail
    }
}
