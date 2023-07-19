import Foundation
import Combine

final class CoinDetailDataService {
  
  let coin: CoinModel
  
  init(coin: CoinModel) {
    self.coin = coin
  }
  
  func getCoinDetails() -> AnyPublisher<CoinDetailModel, Never> {
    let urlString = "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
    
    let url = URL(string: urlString)!
    
    return URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
      .assertNoFailure()
      .eraseToAnyPublisher()
  }
}
