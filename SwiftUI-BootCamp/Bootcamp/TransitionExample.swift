import SwiftUI

struct TransitionExample: View {
    @State var showView: Bool = false
    @State var transition: AnyTransition = .identity
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                makeButton(title: "Identity", t: .identity)
                makeButton(title: "move", t: .move(edge: .bottom))
                makeButton(title: "offset", t: .offset(x: 10, y: 10))
                makeButton(title: "opacity", t: .opacity.animation(.default))
                makeButton(title: "scale", t: .scale.animation(.default))
                makeButton(title: "slide", t: .slide.animation(.default))
                makeButton(title: "asymmetric", t: .asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .trailing)))
                makeButton(title: "push", t: .push(from: .leading).animation(.default))
                Spacer()
            }
            .buttonStyle(.bordered)
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(transition)
                    .animation(.default, value: showView)
            }
        }
    }
    
    func makeButton(title: String, t: AnyTransition) -> some View {
        Button(title) {
            self.transition = t
            showView.toggle()
        }
    }
}

struct TransitionExample_Previews: PreviewProvider {
    static var previews: some View {
        TransitionExample()
    }
}
