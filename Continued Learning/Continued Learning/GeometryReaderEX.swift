import SwiftUI

struct GeometryReaderEX: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { proxy in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: proxy) * 40),
                                axis: (x: 0, y: 1, z: 0)
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = Double(UIScreen.main.bounds.width / 2)
        let currentX = Double(geo.frame(in: .global).midX)
        return 1 - (currentX / maxDistance)
    }
}

struct GeometryReaderEX_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderEX()
    }
}
