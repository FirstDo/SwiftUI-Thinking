import SwiftUI

struct NavigationStackExample: View {

    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            NavigationLink("Push", value: 10)
                .buttonStyle(.borderedProminent)
                .navigationDestination(for: Int.self) { num in
                    
                    VStack {
                        Button("PUSH") {
                            path.append(num + 10)
                        }
                        
                        Button("POP") {
                            path.removeLast()
                        }
                        
                        Button("MoveToRoot") {
                            path = .init()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .navigationTitle("\(num)")
                }
        }
    }
}

struct NavigationStackExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackExample()
    }
}
