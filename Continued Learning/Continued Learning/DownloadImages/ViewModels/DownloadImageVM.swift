import Foundation

@MainActor
final class DownloadImageVM: ObservableObject {
    private let photoDownloadManager = PhotoModelDataService.instance
    
    @Published var dataArray: [PhotoModel] = []
    
    func downloadPhotos() async {
        do {
            dataArray = try await photoDownloadManager.downloadData()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
