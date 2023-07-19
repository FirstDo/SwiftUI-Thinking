import SwiftUI

struct ConditionalStatementExample: View {
    @State var isLoading = false
    
    var body: some View {
        VStack {
            Button("IS LOADING \(isLoading.description)") {
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView()
            }
        }
    }
}

struct ConditionalStatementExample_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalStatementExample()
    }
}
