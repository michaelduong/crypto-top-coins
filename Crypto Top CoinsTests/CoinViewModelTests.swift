//
//  CoinViewModelTests.swift
//  Crypto Top CoinsTests
//
//  Created by Michael Duong on 4/25/24.
//

import XCTest
@testable import Crypto_Top_Coins

final class CoinViewModelTests: XCTestCase {
    var viewModel: CoinViewModelInterface!
    
    class CoinViewModelMock: CoinViewModelInterface {
        var coins: [Coin] = []
        let api: CoinServiceInterface
        
        init(api: CoinServiceInterface) {
            self.api = api
        }
        
        func fetchCoins() async { }
        
        func handleErrors(error: NetworkError) { }
    }
    
    @MainActor override func setUpWithError() throws {
        let data = try! Data(contentsOf: MockedData.responseJSON200)
        let coins = try! jsonDecoder.decode([Coin].self, from: data)
        let httpClient = HTTPClient()
        let cacheManager = CacheManager(userDefaults: UserDefaults.standard)
        let api = CoinService(httpClient: httpClient, cacheManager: cacheManager)
        viewModel = CoinViewModelMock(api: api)
        viewModel.coins = coins
    }
    
    @MainActor func test_parse_json() {
        // Given
        let index = 0 // Bitcoin
        
        // When
        let coin = viewModel.coins[index]
        
        // Then
        XCTAssertEqual(coin.id, "bitcoin")
        XCTAssertEqual(coin.name, "Bitcoin")
        XCTAssertEqual(coin.symbol, "btc")
        XCTAssertEqual(coin.ath, 6110932)
    }
}
