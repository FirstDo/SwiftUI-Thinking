import SwiftUI

struct StateExample: View {
    @State var color: Color = .green
    @State var title: String = "My Title"
    @State var count: Int = .zero
    
    var body: some View {
        ZStack {
            color
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.title)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("BUTTON 1") {
                        color = .red
                        title = "Button 1 was pressed"
                        count += 1
                    }
                    
                    Button("BUTTON 2") {
                        color = .purple
                        title = "Button 2 was pressed"
                        count -= 1
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct StateExample_Previews: PreviewProvider {
    static var previews: some View {
        StateExample()
    }
}
