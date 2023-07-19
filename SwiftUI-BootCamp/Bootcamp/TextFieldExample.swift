import SwiftUI

struct TextFieldExample: View {
    @State var textFieldText: String = ""
    @State var datas = [String]()
    
    var body: some View {
        VStack {
            TextField("Type something here...", text: $textFieldText)
                //.textFieldStyle(.roundedBorder)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .foregroundColor(.red)
                .font(.headline)
            
            Button(action: saveData) {
                Text("Save".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(textIsAppropriate() ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .disabled(!textIsAppropriate())
            
            ForEach(datas, id: \.self) { data in
                Text(data)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("TextField Bootcamp!")
    }
    
    func textIsAppropriate() -> Bool {
        return textFieldText.count >= 3
    }
    
    func saveData() {
        guard textIsAppropriate() else { return }
        datas.append(textFieldText)
        textFieldText = ""
    }
}

struct TextFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TextFieldExample()
        }
    }
}
