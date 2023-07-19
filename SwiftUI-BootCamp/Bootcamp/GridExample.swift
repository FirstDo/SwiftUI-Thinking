import SwiftUI

struct GridExample: View {
    let columns1: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    let columns2: [GridItem] = [
        GridItem(.adaptive(minimum: 50, maximum: 100)),
        GridItem(.adaptive(minimum: 30, maximum: 200))
    ]
    
    let columns3: [GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(150)),
    ]

    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns1) {
                makeViews()
                    .foregroundColor(.red)
            }
            
            LazyVGrid(columns: columns2) {
                makeViews()
                    .foregroundColor(.blue)
            }

            LazyVGrid(columns: columns3) {
                makeViews()
                    .foregroundColor(.green)
            }
        }
    }
    
    @ViewBuilder func makeViews() -> some View {
        ForEach(0..<10) { _ in
            Rectangle()
                .frame(height: 50)
        }
    }
}

struct GridExample_Previews: PreviewProvider {
    static var previews: some View {
        GridExample()
            .padding()
    }
}
