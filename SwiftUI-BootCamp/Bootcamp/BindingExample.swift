import SwiftUI

struct BindingExample: View {
    @State var backgroundColor = Color.green
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            ButtonView(backgroundColor: $backgroundColor)

        }
    }
}

struct BindingExample_Previews: PreviewProvider {
    static var previews: some View {
        BindingExample()
    }
}

struct ButtonView: View {
    @Binding var backgroundColor: Color
    
    var body: some View {
        Button {
            backgroundColor = .orange
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(.blue)
                .cornerRadius(10)
        }
    }
}
