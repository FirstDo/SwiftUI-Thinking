import SwiftUI

struct ListExample: View {
    @State var fruits: [String] = ["apple", "orange", "banana", "peach"]
    @State var veggies: [String] = ["tomato", "potato", "carrot"]
    var body: some View {
        List {
            Section {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit.capitalized)
                        .font(.caption)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.pink)
                        .padding(.vertical)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
                .listRowBackground(Color.blue)
            } header: {
                Text("Fruits")
            }
            
            Section {
                ForEach(veggies, id: \.self) { veg in
                    Text(veg.capitalized)
                }
            } header: {
                Text("Veggies")
            }
        }
        .navigationTitle("Grocery List")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                addButton
            }
        }
        .tint(.red)
    }
    
    var addButton: some View {
        Button("Add") { add() }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indexSet: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indexSet, toOffset: newOffset)
    }
    
    func add() {
        fruits.append("Coconut")
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListExample()
        }
    }
}
