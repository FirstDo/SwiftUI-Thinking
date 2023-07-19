import SwiftUI

struct ContextMenuExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("SwiftUI Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(Color.blue.cornerRadius(30))
        .contextMenu {
            Button {
                
            } label: {
                Label("1", systemImage: "swift")
            }
            
            Button {
                
            } label: {
                Label("2", systemImage: "flame.fill")
            }
            
            Button {
                
            } label: {
                Label("3", systemImage: "swift")
            }
        }
    }
}

struct ContextMenuExample_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuExample()
    }
}
