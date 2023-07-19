import SwiftUI

struct ScrollViewReaderEX: View {
    @State var targetText = ""
    @State var scrollIndex: Int = .zero

    var body: some View {
        ScrollView {
            TextField("Enter a # here...", text: $targetText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll Now") {
                scrollIndex = Int(targetText)!
            }
            
            ScrollViewReader { proxy in
                ForEach(0..<50) { index in
                    Text("This is item #\(index)")
                        .font(.headline)
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding()
                        .id(index)
                }
                .onChange(of: scrollIndex) { newValue in
                    withAnimation(.spring()) {
                        proxy.scrollTo(newValue, anchor: nil)
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderEX_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderEX()
    }
}
