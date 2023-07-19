import SwiftUI

struct ShapeExample: View {
    var body: some View {
        //Circle()
        //Ellipse()
        //Capsule(style: .continuous)
        //Rectangle()
        RoundedRectangle(cornerRadius: 50)
            //.fill(.blue)
            //.foregroundColor(.red)
            //.stroke()
            //.stroke(.red)
            //.stroke(.blue, lineWidth: 30)
            //.stroke(.orange, style: StrokeStyle(lineWidth: 20, lineCap: .butt, dash: [10]))
//            .trim(from: 0.2, to: 1.0)
//            .stroke(.purple, lineWidth: 50)
            .frame(width: 200, height: 100)
    }
}

struct ShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        ShapeExample()
    }
}
