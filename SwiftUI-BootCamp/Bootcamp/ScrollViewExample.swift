import SwiftUI

struct ScrollViewExample: View {
    @Namespace var topIO
    @Namespace var bottomID
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button("Bottom") {
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                }
                .id(topIO)
                
                VStack {
                    ForEach(0..<10) { index in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<20) { index in
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .fill(.white)
                                        .frame(width: 200, height: 150)
                                        .shadow(radius: 10)
                                        .padding()
                                }
                            }
                        }
                    }
                }
                
                Button("Top") {
                    withAnimation {
                        proxy.scrollTo(topIO)
                    }
                }
                .id(bottomID)
            }
        }
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
