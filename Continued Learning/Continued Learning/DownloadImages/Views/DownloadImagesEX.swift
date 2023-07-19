import SwiftUI

struct DownloadImagesEX: View {
    @StateObject var vm = DownloadImageVM()
    
    var body: some View {
        List {
            ForEach(vm.dataArray) { model in
                DownloadImageRow(model: model)
            }
        }
        .navigationTitle("Downloading Images!")
        .task {
            await vm.downloadPhotos()
        }
    }
}

struct DownloadImagesEX_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DownloadImagesEX()
        }
    }
}
