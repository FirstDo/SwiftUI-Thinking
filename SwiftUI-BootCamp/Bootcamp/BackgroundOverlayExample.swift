import SwiftUI

struct BackgroundOverlayExample: View {
    var body: some View {
        Text("SwiftUI")
            .frame(width: 100, height: 100)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .shadow(color: .black, radius: 5, x: 10, y: 10)
            )
    }
}

struct BackgroundOverlayExample_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundOverlayExample()
    }
}
