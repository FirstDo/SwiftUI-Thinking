import SwiftUI

struct DragGestureEX: View {
    
    @State var offset: CGSize = .zero

    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation(.spring()) {
                    offset = value.translation
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    offset = .zero
                }
            }
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(scaleAmount)
                .rotationEffect(rotationAmount)
                .gesture(dragGesture)
        }
    }
    
    var scaleAmount: CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1 - min(percentage, 0.5) * 0.5
    }
    
    var rotationAmount: Angle {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = Double(currentAmount / max)
        
        return Angle(degrees: percentage * 10)
    }
}

struct DragGestureEX_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureEX()
    }
}
