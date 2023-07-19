import SwiftUI

struct SpacerExample: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 100, height: 100)
            
            //Spacer()
            
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
        }
        .padding()
        .background(.blue)
    }
}

struct SpacerExample_Previews: PreviewProvider {
    static var previews: some View {
        SpacerExample()
            .padding()
    }
}
