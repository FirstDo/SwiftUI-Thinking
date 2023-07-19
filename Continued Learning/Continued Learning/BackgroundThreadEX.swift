import SwiftUI

class BackgroundThreadVM: ObservableObject {
    @Published var datas = [String]()
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            DispatchQueue.main.async {
                self.datas = newData
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data = [String]()
        for x in 0..<100 {
            data.append("\(x)")
        }
        return data
    }
}

struct BackgroundThreadEX: View {
    
    @StateObject var vm = BackgroundThreadVM()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.datas, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct BackgroundThreadEX_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundThreadEX()
    }
}
