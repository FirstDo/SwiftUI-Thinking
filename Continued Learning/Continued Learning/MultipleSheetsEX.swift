import SwiftUI

struct RandomeModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsEX: View {
    @State var selectedModel: RandomeModel?
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
                selectedModel = RandomeModel(title: "ONE")
            }
            Button("Button 2") {
                selectedModel = RandomeModel(title: "TWO")
            }
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
    }
}

struct NextScreen: View {
    let selectedModel: RandomeModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsEX_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsEX()
    }
}
