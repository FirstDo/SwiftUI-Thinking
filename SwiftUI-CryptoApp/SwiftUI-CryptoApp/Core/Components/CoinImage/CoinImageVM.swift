import SwiftUI

@MainActor
final class CoinImageVM: ViewModel {
  @Published var image: UIImage? = nil
  @Published var isLoading = false
  private let coin: CoinModel
  
  private let dataService: CoinImageService
  
  init(coin: CoinModel) {
    self.coin = coin
    self.dataService = CoinImageService(coin: coin)
    super.init()
    
    Task { @MainActor in
      await getImage()
    }
  }
  
  
  private func getImage() async  {
    self.image = await dataService.getCoinImage()
  }
}
