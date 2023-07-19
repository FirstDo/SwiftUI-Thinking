import SwiftUI

final class PhotoModelFileManager {
    static let instance = PhotoModelFileManager()
    
    let folderName = "downloaded_photos"
    
    private init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard let url = getFolderPath() else {
            print("folder path가 없습니다")
            return
        }
        
        if FileManager.default.fileExists(atPath: url.path()) {
            try! FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            print("create Folder")
        }
    }
    
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
    
    private func getImagePath(key: String) -> URL? {
        guard let folder = getFolderPath() else {
            print("folder path가 없습니다")
            return nil
        }
        
        return folder.appendingPathComponent(key + ".png")
    }
    
    func add(key: String, value: UIImage) {
        guard let data = value.pngData(),
              let url = getImagePath(key: key) else {
            return
        }
        
        do {
            try data.write(to: url)
            print("파일에 저장")
        } catch {
            print(error)
        }
    }
    
    func get(key: String) -> UIImage? {
        guard let url = getImagePath(key: key),
              FileManager.default.fileExists(atPath: url.path()) else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path())
    }
}
