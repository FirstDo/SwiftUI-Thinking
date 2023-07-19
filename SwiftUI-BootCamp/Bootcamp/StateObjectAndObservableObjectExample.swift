import SwiftUI

struct FruitModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruits = [FruitModel]()
    @Published var isLoading: Bool = false
    
    func deleteFruit(index: IndexSet) {
        fruits.remove(atOffsets: index)
    }
    
    func getFruits() {
        let f1 = FruitModel(name: "Orange", count: 1)
        let f2 = FruitModel(name: "Banana", count: 2)
        let f3 = FruitModel(name: "Watermelon", count: 88)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruits.append(contentsOf: [f1, f2, f3])
            self.isLoading = false
        }
    }
}

struct StateObjectAndObservableObjectExample: View {
    
    @StateObject var vm = FruitViewModel()
    
    var body: some View {
        List {
            
            if vm.isLoading {
                ProgressView()
            } else {
                ForEach(vm.fruits) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                            .foregroundColor(.red)
                        Text(fruit.name)
                            .font(.headline)
                            .bold()
                    }
                }
                .onDelete(perform: vm.deleteFruit(index:))
            }
        }
        .onAppear {
            vm.getFruits()
        }
    }
}

struct StateObjectAndObservableObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StateObjectAndObservableObjectExample()
        }
    }
}
