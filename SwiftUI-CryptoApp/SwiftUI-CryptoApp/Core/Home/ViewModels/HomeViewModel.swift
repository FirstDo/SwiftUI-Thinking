import Foundation
import Combine

final class HomeViewModel: ViewModel {
  enum SortOption {
    case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
  }
  
  @Published var statistics: [StatisticModel] = []
  @Published var allCoins: [CoinModel] = []
  @Published var portfolioCoins: [CoinModel] = []
  @Published var searchText = ""
  @Published var sortOption: SortOption = .holdings
  
  private let dataService = CoinDataService()
  private let marketService = MarketDataService()
  private let portfolioDataService = PortfolioDataService()
  
  override init() {
    super.init()
    addSubscribers()
  }
  
  private func addSubscribers() {
    $searchText
      .combineLatest(dataService.getCoin(), $sortOption)
      .debounce(for: 0.5, scheduler: DispatchQueue.main)
      .map(filterAndSortCoins)
      .sink { [weak self] coins in
        self?.allCoins = coins
      }
      .store(in: &cancelBag)
    
    $allCoins
      .combineLatest(portfolioDataService.$savedEntities)
      .map(mapAllCoinsToPortfolioCoins)
      .sink { [unowned self] coins in
        portfolioCoins = sortPortfolioCoinsIfNeeded(coins: coins)
      }
      .store(in: &cancelBag)
    
    marketService.$marketData
      .combineLatest($portfolioCoins)
      .receive(on: DispatchQueue.main)
      .map(mapGlobalMarketData)
      .sink { [weak self] stats in
        self?.statistics = stats
      }
      .store(in: &cancelBag)
  }
  
  func updatePortfolio(coin: CoinModel, amount: Double) {
    portfolioDataService.updatePortfolio(coin: coin, amount: amount)
  }
  
  private func filterAndSortCoins(text: String, coins: [CoinModel], sort: SortOption) -> [CoinModel] {
    let filteredCoins = filterCoins(text: text, coins: coins)
    return sortCoins(sort: sort, coins: filteredCoins)
  }
  
  private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
    guard !text.isEmpty else { return coins }
    
    let lowercasedText = text.lowercased()
    
    return coins.filter { coin in
      return coin.name.lowercased().contains(lowercasedText) ||
      coin.symbol.lowercased().contains(lowercasedText) ||
      coin.id.lowercased().contains(lowercasedText)
    }
  }
  
  private func sortCoins(sort: SortOption, coins: [CoinModel]) -> [CoinModel] {
    switch sort {
    case .rank, .holdings:
      return coins.sorted { $0.rank < $1.rank }
    case .rankReversed, .holdingsReversed:
      return coins.sorted { $0.rank > $1.rank }
    case .price:
      return coins.sorted { $0.currentPrice < $1.currentPrice }
    case .priceReversed:
      return coins.sorted { $0.currentPrice > $1.currentPrice }
    }
  }
  
  private func sortPortfolioCoinsIfNeeded(coins: [CoinModel]) -> [CoinModel] {
    switch sortOption {
    case .holdings:
      return coins.sorted { $0.currentHoldingValues > $1.currentHoldingValues }
    case .holdingsReversed:
      return coins.sorted { $0.currentHoldingValues < $1.currentHoldingValues }
    default:
      return coins
    }
  }
  
  private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
    allCoins
      .compactMap { coin -> CoinModel? in
        guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
          return nil
        }
        
        return coin.updateHoldings(amount: entity.amount)
      }
  }
  
  private func mapGlobalMarketData(_ model: MarketDataModel?, _ portfolioCoins: [CoinModel]) -> [StatisticModel] {
    guard let model else { return [] }
    
    var stats = [StatisticModel]()
    
    let marketCap = StatisticModel(title: "Market Cap", value: model.marketCap, percentageChange: model.marketCapChangePercentage24HUsd)
    let volume = StatisticModel(title: "24h Volume", value: model.volume)
    let btcDominance = StatisticModel(title: "BTC Dominance", value: model.btcDominance)
    
    let portfolioValue = portfolioCoins
      .map { $0.currentHoldingValues }
      .reduce(0, +)
    
    let previousValue = portfolioCoins
      .map { coin -> Double in
        let currentValue = coin.currentHoldingValues
        let percentChange = coin.priceChangePercentage24H! / 100
        return currentValue / ( 1 + percentChange)
      }
      .reduce(0, +)
    
    let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100
    
    let portfolio = StatisticModel(
      title: "Portfolio value",
      value: portfolioValue.asCurrencyWith2Decimals,
      percentageChange: percentageChange
    )
    
    stats.append(contentsOf: [marketCap, volume, btcDominance, portfolio])
    return stats
  }
}
