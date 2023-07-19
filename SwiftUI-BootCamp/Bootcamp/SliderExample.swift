import SwiftUI

struct SliderExample: View {
    @State var sliderValue: Double = 1

    var body: some View {
        VStack {
            Text("Rating:")
            Text("\(sliderValue)")
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                label: { Text("Title") } ,
                minimumValueLabel: { Text("1") },
                maximumValueLabel: { Text("5") }
            ) { value in
                // onEditingChanged
            }
        }
    }
}

struct SliderExample_Previews: PreviewProvider {
    static var previews: some View {
        SliderExample()
    }
}
