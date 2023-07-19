import SwiftUI
import CoreData


final class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var fruits: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "BootCamp")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
        
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            fruits = try container.viewContext.fetch(request)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func addFruit(text: String) {
        let item = FruitEntity(context: container.viewContext)
        item.name = text
        
        save()
    }
    
    func updateFruit(entity: FruitEntity) {
        let name = (entity.name ?? "") + "!"
        entity.name = name
        
        save()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        let index = indexSet.first!
        let entity = fruits[index]
        container.viewContext.delete(entity)
        
        save()
    }
    
    private func save() {
        if container.viewContext.hasChanges {
            try! container.viewContext.save()
            fetchFruits()
        }
    }
}

struct CoreDataEX: View {
    @StateObject var vm = CoreDataViewModel()
    @State var text: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Add fruit here...", text: $text)
                .font(.headline)
                .frame(height: 55)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button {
                if text.isEmpty { return }
                vm.addFruit(text: text)
                text = ""
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            List {
                ForEach(vm.fruits) { entity in
                    Text(entity.name ?? "noname")
                        .onTapGesture {
                            vm.updateFruit(entity: entity)
                        }
                }
                .onDelete(perform: vm.deleteFruit)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Fruits")
    }
}

struct CoreDataEX_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataEX()
    }
}
