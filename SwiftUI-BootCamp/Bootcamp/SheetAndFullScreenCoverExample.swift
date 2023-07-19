import SwiftUI

struct SheetAndFullScreenCoverExample: View {
    struct Model: Identifiable {
        let id = UUID()
    }
    
    @State var isSheet = false
    @State var isFullScreenCover = false
    @State var data: Model?
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                Button("Sheet") {
                    isSheet.toggle()
                }
                Button("Sheet(Items)") {
                    data = Model()
                }
                Button("FullScreenCover") {
                    isFullScreenCover.toggle()
                }
            }
            .sheet(isPresented: $isSheet) {
                SecondScreen()
                    .presentationDetents([.medium])
            }
            .fullScreenCover(isPresented: $isFullScreenCover) {
                SecondScreen()
            }
            .sheet(item: $data) { data in
                SecondScreen()
            }
        }
    }
}

struct SecondScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
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

struct SheetAndFullScreenCoverExample_Previews: PreviewProvider {
    static var previews: some View {
        SheetAndFullScreenCoverExample()
    }
}
