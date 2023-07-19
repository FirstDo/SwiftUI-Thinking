import SwiftUI

struct StepperExample: View {
    @State var stepperValue: Int = 10
    
    var body: some View {
        VStack {
            Stepper("Stepper1: \(stepperValue)", value: $stepperValue)
                
            Stepper("Stepper2") {
                stepperValue += 10
            } onDecrement: {
                stepperValue -= 10
            }
        }
        .padding(50)
    }
}

struct StepperExample_Previews: PreviewProvider {
    static var previews: some View {
        StepperExample()
    }
}
