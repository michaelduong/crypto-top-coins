//
//  Constants.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

enum Constants {
    enum Endpoints {
        static let baseCoinGeckoURL = "https://api.coingecko.com/api/v3/"
        
        static let coinGeckoTopCoinEndpoint = "\(baseCoinGeckoURL)coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        // Function to construct the coin detail URL
        static func coinGeckoCoinDetailURL(coinId: String) -> String {
            return "\(baseCoinGeckoURL)coins/\(coinId)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
        }
    }
    
    enum Strings {
        static let offlineErrorMessage = "There is currently no network connection."
        static let serverErrorMessage = "There seems to be a server error. Please try again later."
        static let badUrlErrorMessage = "There was an error with the URL/endpoint."
        static let jsonParseErrorMessage = "There was an issue parsing the JSON data properly."
        static let emptyErrorMessage = "The network request returned an empty list/JSON data."
        
        static let appTitle = "Crypto Top Coins"
        static let okButton = "Ok"
    }
    
    enum UserDefaultsKeys {
        static let cache = "cache"
    }
}
