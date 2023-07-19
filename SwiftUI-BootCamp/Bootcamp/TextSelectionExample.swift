import SwiftUI

struct TextSelectionExample: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .textSelection(.enabled)
    }
}

struct TextSelectionExample_Previews: PreviewProvider {
    static var previews: some View {
        TextSelectionExample()
    }
}
