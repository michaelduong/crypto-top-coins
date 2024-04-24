//
//  CoinListView.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import SwiftUI
import ActivityIndicatorView
import Inject

typealias NetworkTask = Task<Void, Never>

struct CoinListView: View {
    @State var coinViewModel: CoinViewModel
    @State var networkTask: NetworkTask?
    @State private var isLoading = false
    @ObserveInjection var inject
    
    var body: some View {
        NavigationView {
            ZStack {
                List(coinViewModel.coins, id: \.id) { coin in
                    CoinView(coin: coin)
                }
                
                ActivityIndicatorView(isVisible: $isLoading, type: .rotatingDots(count: 3))
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
            }
            .listStyle(PlainListStyle())
            .alert(isPresented: coinViewModel.isPresentingAlert) {
                Alert(title: Text(coinViewModel.activeError!), dismissButton: .default(Text(Constants.Strings.okButton)))
            }
            .onAppear {
                isLoading = true
                networkTask = Task {
                    await coinViewModel.fetchCoins()
                    isLoading = false
                }
            }
            .onDisappear {
                networkTask?.cancel()
            }
            .navigationTitle(Constants.Strings.appTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .enableInjection()
    }
}
