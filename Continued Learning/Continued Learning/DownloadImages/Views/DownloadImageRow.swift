import SwiftUI

struct DownloadImageRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            DownloadImageView(url: model.url, key: "\(model.id)")
                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct DownloadImageRow_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageRow(model: PhotoModel(
            albumId: 1,
            id: 1,
            title: "accusamus beatae ad facilis cum similique qui sunt",
            url: "https://via.placeholder.com/600/92c952",
            thumbnailUrl: "https://via.placeholder.com/150/92c952"
        ))
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
