import SwiftUI

struct MagnificationGestureEX: View {
    
    @GestureState private var zoomFactor = 1.0

    var magnification: some Gesture {
        MagnificationGesture()
            .updating($zoomFactor) { currentState, gestureState, transcation in
                gestureState = currentState
            }
    }

    var body: some View {
        VStack(spacing: 10) {
            Rectangle()
                .frame(height: 300)
                .padding()
                .scaleEffect(zoomFactor)
                .gesture(magnification)
                .animation(.spring(), value: zoomFactor)
        }
    }
}

struct MagnificationGestureEX_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureEX()
    }
}
