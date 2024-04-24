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
    func addToCache(coin: Coin) -> Void
    func isInCache(coin: Coin) -> Bool
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
        if let savedData = userDefaults.object(forKey: "cache") as? Data {
            if let savedCache = try? jsonDecoder.decode([Coin].self, from: savedData) {
                cache = Set(savedCache)
                print("Cache size is now \(cache.count)")
            }
        }
    }
    
    func saveCache(coins: [Coin]) {
        let encodedData = try? jsonEncoder.encode(coins)
        userDefaults.set(encodedData, forKey: "cache")
    }
    
    func retrieveCache() -> [Coin] {
        return Array(cache)
    }
    
    func addToCache(coin: Coin) {
        if !isInCache(coin: coin) {
            cache.insert(coin)
            saveCache(coins: cache.map { $0 })
        }
    }
    
    func isInCache(coin: Coin) -> Bool {
        return cache.contains(coin)
    }
}

extension UserDefaults: UserDefaultsInterface { }
