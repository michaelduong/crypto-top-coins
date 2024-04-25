//
//  CoinDetailView.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import SwiftUI
import Inject
import ActivityIndicatorView
import Kingfisher

struct CoinDetailView: View {
    @EnvironmentObject var httpClient: HTTPClient
    @EnvironmentObject var cacheManager: CacheManager
    @ObserveInjection var inject
    @State private var coinDetailViewModel: CoinDetailViewModel?
    @State var networkTask: NetworkTask?
    @State private var isLoading = false
    @State private var readMore: Bool = false
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let coin: Coin
    
    private let spacing: CGFloat = 30
    
    init(coin: Coin) {
        self.coin = coin
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    VStack(spacing: 20) {
                        overviewTitle
                        Divider()
                        coinDescriptionSection
                        overviewGrid
                    }
                    .padding()
                }
            }
            
            ActivityIndicatorView(isVisible: $isLoading, type: .rotatingDots(count: 3))
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
        }
        .alert(isPresented: coinDetailViewModel?.isPresentingAlert ?? .constant(false)) {
            Alert(title: Text(coinDetailViewModel?.activeError ?? "Error"), dismissButton: .default(Text(Constants.Strings.okButton)))
        }
        .onAppear {
            isLoading = true
            let api = CoinDetailService(httpClient: httpClient, cacheManager: cacheManager, coinId: coin.id)
            let coinDetailViewModel = CoinDetailViewModel(api: api, coin: coin)
            self.coinDetailViewModel = coinDetailViewModel
            
            networkTask = Task {
                await coinDetailViewModel.fetchCoinDetails()
                isLoading = false
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                navigationNameAndImage
            }
        }
        .navigationTitle(coinDetailViewModel?.coin.name ?? "N/A")
        .enableInjection()
    }
}

extension CoinDetailView {
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title.bold())
            .foregroundStyle(.tertiary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var coinDescriptionSection: some View {
        ZStack {
            if let coinDescription = coinDetailViewModel?.coinDescription,
               !coinDescription.isEmpty {
                VStack(alignment: .leading) {
                    Text(coinDescription.removingHTMLOccurences)
                        .lineLimit(readMore ? nil : 3)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    Button(action: {
                        withAnimation(.easeIn) {
                            readMore.toggle()
                        }
                    }, label: {
                        Text(readMore ? "Less" : "Read more")
                            .font(.subheadline.bold())
                            .padding(.vertical, 3)
                    })
                    .tint(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private var overviewGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content: {
                ForEach(coinDetailViewModel?.overviewStats ?? []) { stat in
                    StatView(stat: stat)
                }
            })
    }
    
    private var navigationNameAndImage: some View {
        HStack {
            Text(coinDetailViewModel?.coin.symbol.uppercased() ?? "")
                .font(.headline)
                .foregroundStyle(.secondary)
            
            KFImage(URL(string: coinDetailViewModel?.coin.image ?? ""))
                .cancelOnDisappear(true)
                .cacheOriginalImage()
                .retry(maxCount: 3, interval: .seconds(5))
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
        .padding(.trailing, 2)
    }
}
