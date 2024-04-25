//
//  MockData.swift
//  Crypto Top CoinsTests
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

public final class MockedData {
    public static let responseJSON200: URL = Bundle(for: MockedData.self).url(forResource: "coin_response", withExtension: "json")!
}
