import SwiftUI

struct TextExample: View {
    var body: some View {
        Text("hello, World! hello, World! hello, World! hello, World! hello, World! hello, World! hello, World! hello, World! hello, World!".capitalized)
            .font(.body)
            .fontWeight(.semibold)
            .bold()
            .underline(true, color: .red)
            .italic()
            .strikethrough(true, color: .green)
            .font(.system(size: 24, weight: .semibold, design: .serif))
            .baselineOffset(-50.0)
            .kerning(10)
            .lineLimit(10)
            .multilineTextAlignment(.leading)
            .foregroundColor(.red)
            //.frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.5)
    }
}

struct TextExample_Previews: PreviewProvider {
    static var previews: some View {
        TextExample()
    }
}
