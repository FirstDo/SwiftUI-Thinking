import UIKit

@MainActor
final class ImageLoadingVM: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    
    private let url: String
    private let imageKey: String
    
    let manager = PhotoModelFileManager.instance
    
    init(url: String, key: String) {
        self.url = url
        self.imageKey = key
    }
    
    func getImage() async {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("get Cached image!")
        } else {
            await downloadImage()
        }
    }
    
    private func downloadImage() async {
        isLoading = true
        let url = URL(string: url)!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let downloadImage = UIImage(data: data) else { return }
            image = downloadImage
            manager.add(key: imageKey, value: downloadImage)
            isLoading = false
            print("Download Image")
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}
