import SwiftUI

struct AlertExample: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        Button("Click here") {
            showAlert.toggle()
        }
        .alert("Title", isPresented: $showAlert) {
            Button("OK") {}
            
            Button("Delete", role: .destructive) {}
        }
    }
}

struct AlertExample_Previews: PreviewProvider {
    static var previews: some View {
        AlertExample()
    }
}
