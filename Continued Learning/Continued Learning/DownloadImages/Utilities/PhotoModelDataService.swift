import Foundation

final class PhotoModelDataService {
    static let instance = PhotoModelDataService()
    
    private init() {}
    
    func downloadData() async throws -> [PhotoModel] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badURL)
        }
        
        return try JSONDecoder().decode([PhotoModel].self, from: data)
    }
}
