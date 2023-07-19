import Foundation
import Combine

enum NetworkError: Error {
  case unknown
}

final class CoinDataService {
  
  private let fileManager = LocalFileManager.instace
  
  func getCoin() -> AnyPublisher<[CoinModel], Never> {
    let data = fileManager.loadMockData(name: "mock", type: "json")
    let coins = try! JSONDecoder().decode([CoinModel].self, from: data)
      return Just(coins)
          .receive(on: DispatchQueue.main)
          .eraseToAnyPublisher()
  }
}
