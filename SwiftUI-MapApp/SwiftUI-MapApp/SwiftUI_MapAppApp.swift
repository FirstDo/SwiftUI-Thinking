import SwiftUI

@main
struct SwiftUI_MapAppApp: App {
    
    @StateObject private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
