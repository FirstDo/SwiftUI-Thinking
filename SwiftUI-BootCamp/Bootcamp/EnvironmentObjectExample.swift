import SwiftUI

class EnvironmentVM: ObservableObject {
    @Published var dataArray: [String]
    
    init() {
        self.dataArray = ["iPhone", "iPad", "iMac", "Apple Watch"]
    }
}

struct EnvironmentObjectExample: View {
    @StateObject var vm = EnvironmentVM()
    
    var body: some View {
        List {
            ForEach(vm.dataArray, id: \.self) { item in
                NavigationLink {
                    DetailView(selectedItem: item)
                        .environmentObject(vm)
                } label: {
                    Text(item)
                }
            }
        }
    }
}

struct DetailView: View {
    let selectedItem: String
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            NavigationLink {
                FinalView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
            }
        }
    }
}

struct FinalView: View {
    
    @EnvironmentObject var vm: EnvironmentVM
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct EnvironmentObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EnvironmentObjectExample()
                .environmentObject(EnvironmentVM())
        }
    }
}
