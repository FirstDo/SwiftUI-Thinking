import SwiftUI

struct ImagesExample: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .clipped()
            
            Image(systemName: "person.fill.badge.plus")
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
        }
        .frame(height: 600)
    }
}

struct ImagesExample_Previews: PreviewProvider {
    static var previews: some View {
        ImagesExample()
    }
}
