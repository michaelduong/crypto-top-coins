//
//  CoinView.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import SwiftUI
import Inject
import Kingfisher

struct CoinView: View {
    @ObserveInjection var inject
    let coin: Coin
    
    var body: some View {
        HStack {
            KFImage(URL(string: coin.image))
                .cancelOnDisappear(true)
                .cacheOriginalImage()
                .retry(maxCount: 3, interval: .seconds(5))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.priceChangePercentage24H.toPercentString())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
            .padding(.leading, 2)
        }
        .enableInjection()
    }
}
