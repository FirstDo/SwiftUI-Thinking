import SwiftUI

struct DownloadImageView: View {
    @StateObject var vm: ImageLoadingVM
    
    init(url: String, key: String) {
        self._vm = StateObject(wrappedValue: ImageLoadingVM(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                ProgressView()
            } else if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
        .task {
            await vm.getImage()
        }
    }
}

struct DownloadImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageView(url: "https://via.placeholder.com/150/92c952", key: "1")
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
    }
}
