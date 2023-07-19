import SwiftUI

struct BackgroundMaterialExample: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("HI")
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
            .cornerRadius(30)
            
            VStack {
                Text("HI")
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.thickMaterial)
            .cornerRadius(30)
            
            VStack {
                Text("HI")
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
            .cornerRadius(30)
            
            VStack {
                Text("HI")
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            
            VStack {
                Text("HI")
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.ultraThickMaterial)
            .cornerRadius(30)
            
            Spacer()
        }
        .ignoresSafeArea()
        .background(
            Image("sample")
                .resizable()
                .scaledToFill()
        )
    }
}

struct BackgroundMaterialExample_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialExample()
            .ignoresSafeArea()
    }
}
