import SwiftUI

final class LocalFileManager {
    static let instance = LocalFileManager()
    
    private let folderName = "MyApp_Images"
    
    private init() {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
            .appendingPathComponent(folderName)
            .path()
        
        if !FileManager.default.fileExists(atPath: path) {
            try! FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    func deleteFolder() {
        let path = FileManager.default
            .urls(for: .cachesDirectory, in: .userDomainMask).first!
            .appendingPathComponent(folderName).path()
        
        try! FileManager.default.removeItem(atPath: path)
    }
    
    func saveImage(image: UIImage, name: String) {
        let data = image.jpegData(compressionQuality: 1.0)!
        let path = getPathForImage(name: name)
        
        try! data.write(to: path)
    }
    
    func getImage(name: String) -> UIImage? {
        let path = getPathForImage(name: name).path()
        
        if FileManager.default.fileExists(atPath: path) {
            return UIImage(contentsOfFile: path)
        } else {
            return nil
        }
    }
    
    func deleteImage(name: String) {
        let path = getPathForImage(name: name).path()
        
        if FileManager.default.fileExists(atPath: path) {
            try! FileManager.default.removeItem(atPath: path)
        }
    }
    
    private func getPathForImage(name: String) -> URL {
        let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return directory
            .appendingPathComponent(folderName)
            .appendingPathComponent("\(name).jpg")
    }
}

final class FileManagerVM: ObservableObject {
    @Published var image: UIImage?
    let imageName = "m2"
    let manager = LocalFileManager.instance
    
    init() {
//        getImageFromAssetsFolder()
        getImageFromFileManager()
    }
    
    private func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    private func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image else { return }
        manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
}

struct FileManagerEX: View {
    @StateObject var vm = FileManagerVM()
    
    var body: some View {
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .clipped()
                    .cornerRadius(30)
            }
            
            HStack {
                Button {
                    vm.saveImage()
                } label: {
                    Text("Save to FM")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button {
                    vm.deleteImage()
                } label: {
                    Text("Delete to FM")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .navigationTitle("File Manager")
    }
}

struct FileManagerEX_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FileManagerEX()
        }
    }
}
