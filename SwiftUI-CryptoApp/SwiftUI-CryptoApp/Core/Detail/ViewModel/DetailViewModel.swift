import Foundation
import Combine

final class DetailViewModel: ViewModel {
  @Published var overviewStatistics = [StatisticModel]()
  @Published var additionalStatistics = [StatisticModel]()
  @Published var coinDescription: String?
  @Published var websiteURL: String?
  @Published var redditURL: String?
  
  @Published var coin: CoinModel
  
  private let coinDetailService: CoinDetailDataService
  
  init(coin: CoinModel) {
    self.coin = coin
    self.coinDetailService = CoinDetailDataService(coin: coin)
    super.init()
    addSubscribers()
  }
  
  private func addSubscribers() {
    coinDetailService.getCoinDetails()
      .combineLatest($coin)
      .map(mapDataToStatistics)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] result in
        self?.overviewStatistics = result.0
        self?.additionalStatistics = result.1
      }
      .store(in: &cancelBag)
    
    coinDetailService.getCoinDetails()
      .sink { [weak self] details in
        self?.coinDescription = details.readableDescription
        self?.websiteURL = details.links?.homepage?.first
        self?.redditURL = details.links?.subredditURL
      }
      .store(in: &cancelBag)
  }
  
  private func mapDataToStatistics(coinDetailModel: CoinDetailModel, coinModel: CoinModel) -> ([StatisticModel], [StatisticModel]) {
    let price = coinModel.currentPrice.asCurrencyWith6Decimals
    let pricePercentChange = coinModel.priceChangePercentage24H
    let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
    
    let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations ?? "")
    let marketCapPercentChange = coinModel.marketCapChangePercentage24H
    let marketCapStat = StatisticModel(title: "Market Capitalizaation", value: marketCap, percentageChange: marketCapPercentChange)
    
    let rank = "\(coinModel.rank)"
    let rankStat = StatisticModel(title: "Rank", value: rank)
    
    let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations ?? "")
    let volumeStat = StatisticModel(title: "Volume", value: volume)
    
    let overviews = [priceStat, marketCapStat, rankStat, volumeStat]
    
    
    let high = coinModel.high24H?.asCurrencyWith6Decimals ?? "n/a"
    let highStat = StatisticModel(title: "24h High", value: high)
    
    let low = coinModel.high24H?.asCurrencyWith6Decimals ?? "n/a"
    let lowStat = StatisticModel(title: "24h Low", value: low)
    
    let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals ?? "n/a"
    let pricePercentChange2 = coinModel.priceChangePercentage24H
    let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange2)
    
    let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations ?? "")
    let marketCapPercentChange2 = coinModel.marketCapChangePercentage24H
    let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange2)
    
    let blockTime = coinDetailModel.blockTimeInMinutes ?? 0
    let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
    let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
    
    let hashing = coinDetailModel.hashingAlgorithm ?? "n/a"
    let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
    
    let additionals = [highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat]
    
    return (overviews, additionals)
  }
}
