import SwiftUI

struct RotationGestureEX: View {
    
    @State var angle: Angle = Angle(degrees: 0)

    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { value in
                angle = value
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    angle = Angle(degrees: 0)
                }
            }
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(50)
            .background(Color.blue.cornerRadius(20))
            .rotationEffect(angle)
            .gesture(rotationGesture)
    }
}

struct RotationGestureEX_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureEX()
    }
}
