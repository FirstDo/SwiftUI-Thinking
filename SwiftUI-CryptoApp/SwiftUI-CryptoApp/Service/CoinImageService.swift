import UIKit

final class CoinImageService {
  
  private let coin: CoinModel
  private let fileManager = LocalFileManager.instace
  
  init(coin: CoinModel) {
    self.coin = coin
  }
  
  func getCoinImage() async -> UIImage {
    if let image = fileManager.getImage(imageName: coin.id, folderName: "coin_images") {
      print("get from cache!!")
      return image
    } else {
      print("downloading image now")
      return await downloadCoinImage()
    }
  }
  
  private func downloadCoinImage() async -> UIImage {
    let url = URL(string: coin.image)!
    let (data, _) = try! await URLSession.shared.data(from: url)
    
    let image = UIImage(data: data)!
    fileManager.saveImage(image: image, imageName: coin.id, folderName: "coin_images")
    
    return image
  }
}
