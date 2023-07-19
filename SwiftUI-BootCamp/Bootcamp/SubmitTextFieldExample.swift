import SwiftUI

struct SubmitTextFieldExample: View {
    @State private var text: String = ""
    var body: some View {
        TextField("Placeholder...", text: $text)
            .submitLabel(.done)
            .onSubmit {
                // Do Something, when press submit button
            }
    }
}

struct SubmitTextFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTextFieldExample()
    }
}
