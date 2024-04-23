//
//  Constants.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

enum Constants {
    enum Endpoints {
        static let coinGeckoTopCoinURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
    }
    
    enum Strings {
        static let offlineErrorMessage = "There is currently no network connection."
        static let serverErrorMessage = "There seems to be a server error. Please try again later."
        static let badUrlErrorMessage = "There was an error with the URL/endpoint."
        static let jsonParseErrorMessage = "There was an issue parsing the JSON data properly."
        static let emptyErrorMessage = "The network request returned an empty list/JSON data."
    }
}
