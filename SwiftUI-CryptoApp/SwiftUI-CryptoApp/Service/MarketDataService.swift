import Foundation
import Combine

final class MarketDataService {
  
  @Published var marketData: MarketDataModel?
  
  private let fileManager = LocalFileManager.instace
  
  init() {
    Task {
      await getCoin()
    }
  }
  
  func getCoin() async {
    
    let url = URL(string: "https://api.coingecko.com/api/v3/global")!
    
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let model = try JSONDecoder().decode(GlobalData.self, from: data)
      marketData = model.data
    } catch {
      print("marketDataService ERROR!!")
    }
  }
}
