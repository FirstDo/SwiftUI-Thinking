import SwiftUI

struct SafeAreaExample: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationTitle("SafeArea")
        }
    }
}

struct SafeAreaExample_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaExample()
    }
}
