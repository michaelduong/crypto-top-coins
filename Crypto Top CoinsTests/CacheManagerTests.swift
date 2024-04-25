//
//  CacheManagerTests.swift
//  Crypto Top CoinsTests
//
//  Created by Michael Duong on 4/25/24.
//

import XCTest
@testable import Crypto_Top_Coins

final class CacheManagerTests: XCTestCase {
    var cacheManager: CacheManager!
    let mockUserDefaults = MockUserDefaults()
    
    class MockUserDefaults: UserDefaultsInterface {
        var userDefaultsHash: [String: Any] = [:]
        
        func object(forKey: String) -> Any? {
            if userDefaultsHash[forKey] != nil {
                return userDefaultsHash[forKey]
            } else {
                return nil
            }
        }
        
        func set(_ value: Any?, forKey: String) {
            userDefaultsHash[forKey] = value
        }
    }
    
    override func setUpWithError() throws {
        self.cacheManager = CacheManager(userDefaults: mockUserDefaults)
        let coins = generateMockCoins()
        cacheManager.saveCache(coins: coins)
    }
    
    override func tearDownWithError() throws {
        if let bundleID = Bundle.main.bundleIdentifier {
            self.cacheManager.userDefaults.removePersistentDomain(forName: bundleID)
        }
    }
    
    func testLoadCache() {
        // Given
        // In our setUpWithError() method we are loading up the cache by saving some mock items in there before we run our tests
        
        // When
        cacheManager.loadCache()
        
        // Then
        XCTAssertEqual(cacheManager.cache.count, 3)
        XCTAssertNotNil(cacheManager.userDefaults.object(forKey: "cache"))
    }
    
    func testSaveCache() {
        // Given
        cacheManager.userDefaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!) // remove existing cache to be safe
        let coins = generateMockCoins()
        
        // When
        cacheManager.saveCache(coins: coins)
        // after we save the cache, we want to load it again so that it overwrites our cache Set in CacheManager to reflect this change
        cacheManager.loadCache()
        
        // Then
        XCTAssertNotNil(cacheManager.userDefaults.object(forKey: "cache"))
        XCTAssertEqual(cacheManager.cache.count, 3)
    }
}

extension CacheManagerTests {
    private func generateMockCoins() -> [Coin] {
        let mockCoins: [Coin] = [
            Coin(
                id: "bitcoin",
                symbol: "BTC",
                name: "Bitcoin",
                image: "https://example.com/bitcoin.png",
                currentPrice: 45000.0,
                marketCapRank: 1,
                marketCap: 850000000000,
                fullyDilutedValuation: 900000000000,
                totalVolume: 35000000000,
                high24H: 46000,
                low24H: 44000,
                priceChange24H: -500,
                priceChangePercentage24H: -1.1,
                marketCapChange24H: -8000000000,
                marketCapChangePercentage24H: -0.94,
                circulatingSupply: 18500000,
                totalSupply: 21000000,
                maxSupply: 21000000,
                ath: 65000,
                athChangePercentage: -30.77,
                athDate: "2023-11-10",
                atl: 100,
                atlChangePercentage: 45000,
                atlDate: "2010-07-19",
                lastUpdated: "2024-04-24T22:15:00Z",
                priceChangePercentage24HInCurrency: -1.1,
                coinDetail: nil
            ),
            Coin(
                id: "ethereum",
                symbol: "ETH",
                name: "Ethereum",
                image: "https://example.com/ethereum.png",
                currentPrice: 3000.0,
                marketCapRank: 2,
                marketCap: 350000000000,
                fullyDilutedValuation: 360000000000,
                totalVolume: 20000000000,
                high24H: 3100,
                low24H: 2900,
                priceChange24H: -100,
                priceChangePercentage24H: -3.2,
                marketCapChange24H: -4000000000,
                marketCapChangePercentage24H: -1.14,
                circulatingSupply: 115000000,
                totalSupply: 120000000,
                maxSupply: 120000000,
                ath: 4800,
                athChangePercentage: -37.5,
                athDate: "2021-05-12",
                atl: 0.75,
                atlChangePercentage: 400000,
                atlDate: "2015-08-07",
                lastUpdated: "2024-04-24T22:20:00Z",
                priceChangePercentage24HInCurrency: -3.2,
                coinDetail: nil
            ),
            Coin(
                id: "ripple",
                symbol: "XRP",
                name: "Ripple",
                image: "https://example.com/ripple.png",
                currentPrice: 0.85,
                marketCapRank: 3,
                marketCap: 40000000000,
                fullyDilutedValuation: 42000000000,
                totalVolume: 1000000000,
                high24H: 0.90,
                low24H: 0.80,
                priceChange24H: -0.05,
                priceChangePercentage24H: -5.9,
                marketCapChange24H: -200000000,
                marketCapChangePercentage24H: -0.5,
                circulatingSupply: 47000000000,
                totalSupply: 100000000000,
                maxSupply: 100000000000,
                ath: 3.84,
                athChangePercentage: -77.86,
                athDate: "2018-01-07",
                atl: 0.003,
                atlChangePercentage: 28333,
                atlDate: "2013-08-16",
                lastUpdated: "2024-04-24T22:25:00Z",
                priceChangePercentage24HInCurrency: -5.9,
                coinDetail: nil
            )
        ]
        
        return mockCoins
    }
}
