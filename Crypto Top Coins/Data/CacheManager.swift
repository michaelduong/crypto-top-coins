//
//  CacheManager.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/24/24.
//

import Foundation

protocol CacheManagerInterface {
    var cache: Set<Coin> { get set }
    
    func loadCache() -> Void
    func saveCache(coins: [Coin]) -> Void
    func retrieveCache() -> [Coin]
    func addToCache(with coin: Coin) -> Void
    func removeFromCache(coin: Coin) -> Void
    func updateCache(for identifier: CoinIdentifier, withDetails newDetails: CoinDetail?) -> Void
    func findCoin(by id: String) -> Coin?
}

protocol UserDefaultsInterface {
    func object(forKey: String) -> Any?
    func set(_ value: Any?, forKey: String)
}

final class CacheManager: CacheManagerInterface {
    var cache: Set<Coin> = []
    let userDefaults = UserDefaults.standard
    let jsonEncoder = JSONEncoder()
    
    init(userDefaults: UserDefaultsInterface = UserDefaults.standard) {
        loadCache()
    }
    
    func loadCache() {
        if let savedData = userDefaults.object(forKey: Constants.UserDefaultsKeys.cache) as? Data {
            if let savedCache = try? jsonDecoder.decode([Coin].self, from: savedData) {
                cache = Set(savedCache)
                print("Cache size is now \(cache.count)")
            }
        }
    }
    
    func saveCache(coins: [Coin]) {
        let encodedData = try? jsonEncoder.encode(coins)
        userDefaults.set(encodedData, forKey: Constants.UserDefaultsKeys.cache)
    }
    
    func retrieveCache() -> [Coin] {
        return Array(cache)
    }
    
    func addToCache(with coin: Coin) {
        cache.insert(coin)
        saveCache(coins: cache.map { $0 })
    }
    
    func removeFromCache(coin: Coin) {
        if let index = cache.firstIndex(of: coin) {
            cache.remove(at: index)
            saveCache(coins: cache.map { $0 })
        }
    }
    
    func updateCache(for identifier: CoinIdentifier, withDetails newDetails: CoinDetail? = nil) {
        let coin: Coin?
        switch identifier {
        case .coin(let c):
            coin = c
        case .id(let id):
            coin = findCoin(by: id)
        }
        
        guard var updatedCoin = coin else {
            print("Coin not found.")
            return
        }
        
        if let details = newDetails {
            updatedCoin.coinDetail = details
        }
        
        // Remove the old coin if it exists
        if let coin {
            removeFromCache(coin: coin)
        }
        
        // Insert the updated coin
        addToCache(with: updatedCoin)
    }
}

extension CacheManager {
    func findCoin(by id: String) -> Coin? {
        return cache.first { $0.id == id }
    }
}

extension UserDefaults: UserDefaultsInterface { }
