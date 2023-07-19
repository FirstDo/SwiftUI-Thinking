import SwiftUI

struct AppStorageExample: View {
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack {
            Text(currentUserName ?? "Add Name Here")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save") {
                currentUserName = "Nick"
            }
        }
    }
}

struct AppStorageExample_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageExample()
    }
}
