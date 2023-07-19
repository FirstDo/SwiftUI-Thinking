import SwiftUI

struct WeakSelfEX: View {
    @AppStorage("count") var count: Int?
    
    var body: some View {
        ZStack {
            NavigationLink(
                "Navigate",
                destination: WeakSelfSecondView()
            )
            .navigationTitle("Screen 1")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing) {
            Text("\(count ?? .zero)")
                .font(.largeTitle)
                .padding()
                .background(Color.green.cornerRadius(10))
        }
    }
}

struct WeakSelfSecondView: View {
    @StateObject var vm = WeakSelfSecondVM()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

class WeakSelfSecondVM: ObservableObject {
    @AppStorage("count") var count: Int?
    @Published var data: String?
    
    init() {
        print("INIT")
        
        if count == nil {
            count = 0
        }
        count! += 1
        
        getData()
    }
    
    deinit {
        print("DEINIT")
        count! -= 1
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.data = "NEW DATA!!!"
        }
    }
}

struct WeakSelfEX_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WeakSelfEX()
        }
    }
}
