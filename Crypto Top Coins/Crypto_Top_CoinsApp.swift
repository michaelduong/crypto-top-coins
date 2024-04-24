//
//  Crypto_Top_CoinsApp.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import SwiftUI

@main
struct Crypto_Top_CoinsApp: App {
    var body: some Scene {
        let httpClient = HTTPClient()
        let cacheManager = CacheManager()
        let api = CoinService(httpClient: httpClient, cacheManager: cacheManager)
        let coinViewModel = CoinViewModel(api: api)
        
        WindowGroup {
            CoinListView(coinViewModel: coinViewModel)
        }
    }
}
