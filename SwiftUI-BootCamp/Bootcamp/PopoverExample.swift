import SwiftUI

struct PopoverExample: View {
    
    @State var isSheet: Bool = false
    @State var isTransition: Bool = false
    @State var isAnimate: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Button("Sheet") {
                    isSheet.toggle()
                }
                
                Button("Transtion") {
                    isTransition.toggle()
                }
                
                Button("PopOver") {
                    isAnimate.toggle()
                }
                
                Spacer()
            }
            .font(.largeTitle)
            
             // Sheet
            .sheet(isPresented: $isSheet) {
                SheetScreen()
            }
            
            // Transition
            
            ZStack {
                if isTransition {
                    TransitionScreen(showNewScreen: $isTransition)
                        .padding(.top, 100)
                        .transition(.move(edge: .bottom))
                        .animation(.spring())
                }
            }
            .zIndex(2.0)
            
            // Animation Offset
            
            NewScreen(isAnimate: $isAnimate)
                .padding(.top, 100)
                .offset(y: isAnimate ? 0 : UIScreen.main.bounds.height)
                .animation(.spring(), value: isAnimate)
        }
    }
}

struct SheetScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .edgesIgnoringSafeArea(.all)
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }

        }
    }
}

struct TransitionScreen: View {
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            Button {
                showNewScreen.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }

        }
    }
}

struct NewScreen: View {
    @Binding var isAnimate: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .edgesIgnoringSafeArea(.all)
            
            Button {
                isAnimate.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }

        }
    }
}

struct PopoverExample_Previews: PreviewProvider {
    static var previews: some View {
        PopoverExample()
    }
}
