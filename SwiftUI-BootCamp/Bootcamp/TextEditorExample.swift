import SwiftUI

struct TextEditorExample: View {
    @State var textEditorText: String = "This is the starting text."
    @State var savedText: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $textEditorText)
                .frame(height: 250)
                .colorMultiply(.gray.opacity(0.9))
                .cornerRadius(10)
            Button {
                savedText = textEditorText
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Text(savedText)
            
            Spacer()
        }
        .padding()
        .background(Color.green)
        .navigationTitle("TextEditor Bootcamp!")
    }
}

struct TextEditorExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TextEditorExample()
        }
    }
}
