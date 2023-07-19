import SwiftUI

struct NavigationViewAndLinkExample: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Hello, world!", destination: MyOtherScreen())
            }
            .navigationTitle("All Inboxes")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: MyOtherScreen()) {
                        Image(systemName: "gear")
                    }
                    .tint(.red)
                }
            }
        }
    }
}

struct MyOtherScreen: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
                .navigationTitle("Green Screen!")
        }
    }
}

struct NavigationViewAndLink_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewAndLinkExample()
    }
}
