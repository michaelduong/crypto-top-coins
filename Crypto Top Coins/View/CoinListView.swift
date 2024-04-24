//
//  CoinListView.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import SwiftUI
import Inject

typealias NetworkTask = Task<Void, Never>

struct CoinListView: View {
    @State var coinViewModel: CoinViewModel
    @State var networkTask: NetworkTask?
    @ObserveInjection var inject
    
    var body: some View {
        NavigationView {
            List(coinViewModel.coins, id: \.id) { coin in
                CoinView(coin: coin)
            }
            .listStyle(PlainListStyle())
            .alert(isPresented: coinViewModel.isPresentingAlert) {
                Alert(title: Text(coinViewModel.activeError!), dismissButton: .default(Text("Ok")))
            }
            .onAppear {
                networkTask = Task {
                    await coinViewModel.fetchCoins()
                }
            }
            .onDisappear {
                networkTask?.cancel()
            }
            .navigationTitle("Crypto Top Trending Coins")
            .navigationBarTitleDisplayMode(.inline)
        }
        .enableInjection()
    }
    
}
