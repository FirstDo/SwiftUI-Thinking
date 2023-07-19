import SwiftUI

struct PickerExample: View {
    @State var selection: String = "Most Recent"
    let filterOptions = ["Most Recent", "Most Popular", "Most Liked"]

    var body: some View {
        Picker(selection: $selection) {
            ForEach(filterOptions, id: \.self) { str in
                Text(str)
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .tag(str)
            }
        } label: {
            Text("Picker")
        }
        .pickerStyle(.wheel)
    }
}

struct PickerExample_Previews: PreviewProvider {
    static var previews: some View {
        PickerExample()
    }
}
