import SwiftUI
import Combine

class SubscriberVM: ObservableObject {
    @Published var count: Int = 0
    @Published var text: String = ""
    @Published var textIsValid: Bool = false
    @Published var showButton: Bool = false
    
    var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setupTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    private func addTextFieldSubscriber() {
        $text
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { $0.count > 3 }
            .sink { [weak self] isValid in
                withAnimation {
                    self?.textIsValid = isValid
                }
            }
            .store(in: &cancellables)
    }
    
    private func setupTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                
                count += 1
            }
            .store(in: &cancellables)
    }
    
    private func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .print()
            .sink { [weak self] isValid, count in
                guard let self else { return }
                showButton = isValid && count >= 10
            }
            .store(in: &cancellables)
        
    }
}

struct SubscriberEX: View {
    @StateObject var vm = SubscriberVM()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            Text(vm.textIsValid.description)
            
            TextField("Type something here...", text: $vm.text)
                .padding(.leading)
                .frame(height: 55)
                .background(Color(uiColor: .systemGray6).cornerRadius(10))
                .overlay(alignment: .trailing) {
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity(
                                vm.text.count < 1 ? .zero :
                                vm.textIsValid ? .zero : 1.0
                            )
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(vm.textIsValid ? 1.0 : .zero)
                        
                    }
                    .font(.title)
                    .padding()
                }
            
            Button(action: {}) {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .opacity(vm.showButton ? 1.0 : 0.5)
            }
            .disabled(!vm.showButton)
        }
        .padding()
    }
}

struct SubscriberEX_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberEX()
    }
}
