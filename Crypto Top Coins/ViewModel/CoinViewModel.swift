//
//  CoinViewModel.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation
import SwiftUI

@MainActor protocol CoinViewModelInterface {
    var coins: [Coin] { get set }
    var api: CoinServiceInterface { get }
    
    func fetchCoins() async
    func handleErrors(error: NetworkError)
}

@Observable
@MainActor final class CoinViewModel: CoinViewModelInterface {
    var coins: [Coin] = []
    let api: CoinServiceInterface
    private(set) var activeError: String?
    
    var isPresentingAlert: Binding<Bool> {
        return Binding<Bool>(get: {
            return self.activeError != nil
        }, set: { newValue in
            guard !newValue else { return }
            self.activeError = nil
        })
    }
    
    init(api: CoinServiceInterface) {
        self.api = api
    }
    
    func fetchCoins() async {
        do {
            self.coins = try await api.fetchCoins()
            if coins.isEmpty {
                handleErrors(error: .emptyData)
            } else {
                sortTopMoverCoins()
            }
        } catch {
            if let networkError = error as? NetworkError {
                handleErrors(error: networkError)
            }
        }
    }
    
    func sortTopMoverCoins() {
        coins = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
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
