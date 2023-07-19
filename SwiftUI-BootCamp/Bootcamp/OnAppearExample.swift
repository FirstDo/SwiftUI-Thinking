import SwiftUI

struct OnAppearExample: View {
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                
            }
            .onDisappear {
                
            }
            .task {
                
            }
    }
}

struct OnAppearExample_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearExample()
    }
}
