import SwiftUI

struct DragGestureEX2: View {
    
    @State var staringOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = .zero
    @State var endingOffsetY: CGFloat = .zero
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation {
                    currentDragOffsetY = value.translation.height
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    if currentDragOffsetY < -150 {
                        endingOffsetY = -staringOffsetY
                    } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                        endingOffsetY = 0
                    }
                    
                    currentDragOffsetY = 0
                }
            }
    }
    
    var body: some View {
        ZStack {
            Color.secondary.ignoresSafeArea()
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .offset(y: staringOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(dragGesture)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct DragGestureEX2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureEX2()
    }
}
