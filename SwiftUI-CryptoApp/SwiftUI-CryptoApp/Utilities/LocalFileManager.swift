import UIKit

final class LocalFileManager {
  
  static let instace = LocalFileManager()
  private init() { }
  
  func loadMockData(name: String, type: String) -> Data {
    let path = Bundle.main.path(forResource: name, ofType: type)!
    let jsonString = try! String(contentsOfFile: path)
    return jsonString.data(using: .utf8)!
  }
  
  func saveImage(image: UIImage, imageName: String, folderName: String) {
    
    createFolderIfNeeded(folderName: folderName)
    
    let data = image.pngData()!
    let url = getURLFor(imageName: imageName, folderName: folderName)
    
    do {
      try data.write(to: url)
    } catch {
      print("Error Saving Image. \(error)")
    }
  }
  
  func getImage(imageName: String, folderName: String) -> UIImage? {
    let url = getURLFor(imageName: imageName, folderName: folderName)
    
    if FileManager.default.fileExists(atPath: url.path) {
      return UIImage(contentsOfFile: url.path)
    } else {
      return nil
    }
  }
  
  private func createFolderIfNeeded(folderName: String) {
    let url = getURLFor(folderName: folderName)
    
    if !FileManager.default.fileExists(atPath: url.path) {
      do {
        try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
      } catch {
        print("Error creating direcotry")
      }
    }
  }
  
  private func getURLFor(folderName: String) -> URL {
    let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    return url.appendingPathComponent(folderName)
  }
  
  private func getURLFor(imageName: String, folderName: String) -> URL {
    let folderURL = getURLFor(folderName: folderName)
    return folderURL.appendingPathComponent(imageName + ".png")
  }
}
