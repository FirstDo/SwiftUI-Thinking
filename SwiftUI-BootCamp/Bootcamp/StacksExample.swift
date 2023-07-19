import SwiftUI

struct StacksExample: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .offset(y: 50)
                .zIndex(1)
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
        }

    }
}

struct StacksExample_Previews: PreviewProvider {
    static var previews: some View {
        StacksExample()
    }
}
