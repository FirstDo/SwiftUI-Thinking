import SwiftUI

struct GradientsExample: View {
    var body: some View {
        VStack {
//            RoundedRectangle(cornerRadius: 25)
//                .fill(
//                    LinearGradient(
//                        gradient: Gradient(colors: [.red, .blue, .orange, .black]),
//                        startPoint: .topLeading,
//                        endPoint: .bottomTrailing
//                    )
//                )
            
//            RoundedRectangle(cornerRadius: 25)
//                .fill(
//                    RadialGradient(
//                        gradient: Gradient(colors: [.red, .yellow]),
//                        center: .center,
//                        startRadius: 10,
//                        endRadius: 100
//                    )
//                )

            RoundedRectangle(cornerRadius: 25)
                .fill(
                    AngularGradient(
                        gradient: Gradient(colors: [.red, .blue, .green]),
                        center: .center,
                        angle: .degrees(0)
                    )
                )

        }
        .frame(width: 300, height: 300)
        
    }
}

struct GradientsExample_Previews: PreviewProvider {
    static var previews: some View {
        GradientsExample()
    }
}
