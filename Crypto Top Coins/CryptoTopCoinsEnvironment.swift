//
//  CryptoTopCoinsEnvironment.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

public enum CryptoTopCoinsEnvironment {
    
    enum Keys {
        static let coinGeckoApiKey = "COINGECKO_API_KEY"
    }
    
    ///Getting plist here
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            print("CryptoTopCoinsEnvironment ERROR: plist file not found")
            return [:]
        }
        return dict
    }()
    
    static let coinGeckoApiKey: String = {
        guard let coinGeckoApiKey = CryptoTopCoinsEnvironment.infoDictionary[Keys.coinGeckoApiKey] as? String else {
            print("CryptoTopCoinsEnvironment ERROR: API Key not set in plist for this environment")
            return ""
        }
        return coinGeckoApiKey
    }()
}
