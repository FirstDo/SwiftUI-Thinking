import SwiftUI

struct ActionSheetExample: View {
    
    @State var showActionSheet: Bool = false
    
    var body: some View {
        Button("Click me") {
            showActionSheet.toggle()
        }
        .confirmationDialog("Dialog", isPresented: $showActionSheet) {
            ForEach(0..<10) { num in
                Button("\(num)") {
                    
                }
            }
        }
    }
}

struct ActionSheetExample_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetExample()
    }
}
