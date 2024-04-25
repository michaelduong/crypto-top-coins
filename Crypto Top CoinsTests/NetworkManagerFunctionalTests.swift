//
//  NetworkManagerFunctionalTests.swift
//  Crypto Top CoinsTests
//
//  Created by Michael Duong on 4/23/24.
//

import XCTest
@testable import Crypto_Top_Coins

final class NetworkManagerFunctionalTests: XCTestCase {
    var api: CoinService!
    let httpClient = HTTPClient()
    let cacheManager = CacheManager()
    
    override func setUpWithError() throws {
        self.api = CoinService(httpClient: httpClient, cacheManager: cacheManager)
    }
    
    override func tearDownWithError() throws { }
    
    func test_End_to_End() async {
        // Given
        let expectation = expectation(description: "Wait for network to finish")
        
        // When
        do {
            let response = try await api.fetchCoins()
            XCTAssertTrue(response.count > 0)
            expectation.fulfill()
        } catch {
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        // Then
        await fulfillment(of: [expectation], timeout: 10.0)
    }
}
