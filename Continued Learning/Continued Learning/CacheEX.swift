import SwiftUI

class CacheManager {
    static let instance = CacheManager()
    private init() { }
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024  * 100
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
        print("Added to Cache!")
    }
    
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
        print("removed from cache")
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
}

class CacheVM: ObservableObject {
    @Published var staringImage: UIImage?
    @Published var cachedImage: UIImage?
    private let imageName = "m2"
    let cacheManager = CacheManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    
    private func getImageFromAssetsFolder() {
        staringImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let staringImage else { return }
        cacheManager.add(image: staringImage, name: imageName)
    }
    
    func removeFromCache() {
        cacheManager.remove(name: imageName)
    }
    
    func getFromCache() {
        cachedImage = cacheManager.get(name: imageName)
    }
}

struct CacheEX: View {
    @StateObject var vm = CacheVM()
    
    var body: some View {
        VStack {
            if let image = vm.staringImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(10)
            }
            
            HStack {
                Button {
                    vm.saveToCache()
                } label: {
                    Text("Save to Cache")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button {
                    vm.removeFromCache()
                } label: {
                    Text("Delete from Cache")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            
            Button {
                vm.getFromCache()
            } label: {
                Text("Get from Cache")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
            if let image = vm.cachedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .navigationTitle("Cache")
    }
}

struct CacheEX_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CacheEX()
        }
    }
}
