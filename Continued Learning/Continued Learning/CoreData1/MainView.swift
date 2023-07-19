import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: FruitEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)]
    )
    private var fruits: FetchedResults<FruitEntity>
    @State var text: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Add fruit here...", text: $text)
                .font(.headline)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button {
                addItem()
            } label: {
                Text("Submit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            
            List {
                ForEach(fruits) { fruit in
                    Text(fruit.name ?? "")
                        .onTapGesture {
                            updateItem(fruit: fruit)
                        }
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Fruits")
    }
    
    private func addItem() {
        withAnimation {
            let newFruit = FruitEntity(context: viewContext)
            newFruit.name = text
            saveItems()
        }
    }
    
    private func updateItem(fruit: FruitEntity) {
        withAnimation {
            let currentName = fruit.name ?? ""
            let newName = currentName + "!"
            fruit.name = newName
            saveItems()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            let index = offsets.first!
            let entity = fruits[index]
            viewContext.delete(entity)
            saveItems()
        }
    }
    
    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView()
        }
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
    }
}
