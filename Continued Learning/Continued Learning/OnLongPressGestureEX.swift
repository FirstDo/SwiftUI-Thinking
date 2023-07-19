import SwiftUI

struct OnLongPressGestureEX: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    @State var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : .zero)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 0.8, maximumDistance: 50) {
                        withAnimation(.easeInOut) {
                            isSuccess = true
                            text = "isSuccess"
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            text = "isPressing"
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete.toggle()
                            }
                        } else {
                            text = "is not Pressing"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }
                
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
    }
}

struct OnLongPressGestureEX_Previews: PreviewProvider {
    static var previews: some View {
        OnLongPressGestureEX()
    }
}
