import SwiftUI

struct MaskEX: View {
    
    @State var rating = 3
    
    var body: some View {
        ZStack {
            starView
                .overlay(overlayView.mask(starView))
        }
    }
    
    private var overlayView: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * proxy.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskEX_Previews: PreviewProvider {
    static var previews: some View {
        MaskEX()
    }
}
