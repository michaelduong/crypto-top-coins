//
//  CoinDetailViewModel.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation
import SwiftUI

@MainActor protocol CoinDetailViewModelInterface {
    var api: CoinDetailServiceInterface { get }
    var coin: Coin { get }
    var coinDetail: CoinDetail? { get set }
    
    func fetchCoinDetails() async
    func handleErrors(error: NetworkError)
}

@Observable
@MainActor class CoinDetailViewModel: CoinDetailViewModelInterface {
    var overviewStats: [StatModel] = []
    var coinDescription: String? = nil
    var coin: Coin
    var coinDetail: CoinDetail?
    
    private(set) var activeError: String?
    
    var isPresentingAlert: Binding<Bool> {
        return Binding<Bool>(get: {
            return self.activeError != nil
        }, set: { newValue in
            guard !newValue else { return }
            self.activeError = nil
        })
    }
    
    let api: CoinDetailServiceInterface
    
    init(api: CoinDetailServiceInterface, coin: Coin) {
        self.api = api
        self.coin = coin
    }
    
    func fetchCoinDetails() async {
        do {
            let coinDetails = try await api.fetchCoinDetails()
            
            self.overviewStats = mapCoinDetailsToStats(coinDetail: coinDetails, coin: coin)
            
            self.coinDescription = coinDetails?.description?.en
        } catch {
            if let networkError = error as? NetworkError {
                handleErrors(error: networkError)
                print("Failed to fetch coin details: \(error)")
            }
        }
    }
    
    private func mapCoinDetailsToStats(coinDetail: CoinDetail?, coin: Coin) -> [StatModel] {
        let overviewArray = overviewArray(coin: coin)
        return overviewArray
    }
    
    private func overviewArray(coin: Coin) -> [StatModel] {
        let price = coin.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coin.priceChangePercentage24H
        let priceStat = StatModel(title: "Current price", value: price, percentageChange: pricePercentChange)
        
        
        let marketCap = "$" + (coin.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
        
        let rank = "\(coin.marketCapRank)"
        let rankStat = StatModel(title: "Rank", value: rank)
        
        let volume =  "$" + (coin.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatModel(title: "Volume", value: volume)
        
        let overView: [StatModel]  = [priceStat, marketCapStat, rankStat, volumeStat]
        return overView
    }
    
    func handleErrors(error: NetworkError) {
        var message = ""
        switch error {
        case .invalidJSON:
            message = NSLocalizedString(Constants.Strings.badUrlErrorMessage, comment: "")
        case .serverError:
            message = NSLocalizedString(Constants.Strings.serverErrorMessage, comment: "")
        case .noNetwork:
            message = NSLocalizedString(Constants.Strings.offlineErrorMessage, comment: "")
        case .badURL:
            message = NSLocalizedString(Constants.Strings.badUrlErrorMessage, comment: "")
        case .emptyData:
            message = NSLocalizedString(Constants.Strings.emptyErrorMessage, comment: "")
        }
        
        activeError = message
    }
}
