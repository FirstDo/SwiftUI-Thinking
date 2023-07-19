import SwiftUI

struct ForEachExample: View {
    var body: some View {
        VStack {
            ForEach(0..<100) { index in
                Circle()
                    .frame(height: 30)
            }
        }
    }
}

struct ForEachExample_Previews: PreviewProvider {
    static var previews: some View {
        ForEachExample()
    }
}
