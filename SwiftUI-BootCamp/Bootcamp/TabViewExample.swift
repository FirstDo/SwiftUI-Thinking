import SwiftUI

struct TabViewExample: View {
    @State var selectedTab: Int = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
                .tag(0)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
                .tag(1)
            RoundedRectangle(cornerRadius: 20)
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
                .tag(2)
        }
    }
}

struct TabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExample()
    }
}
