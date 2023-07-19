import SwiftUI

struct ColorExample: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //Color.primary
                Color(UIColor.secondarySystemBackground)
            )
            .frame(width: 300, height: 300)
            //.shadow(radius: 10)
            .shadow(color: .red.opacity(0.5), radius: 13, x: -20, y: -20)
    }
}

struct ColorExample_Previews: PreviewProvider {
    static var previews: some View {
        ColorExample()
    }
}
