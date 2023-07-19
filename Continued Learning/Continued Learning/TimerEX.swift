import SwiftUI


struct TimerEX: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = .now
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: .init(colors: [.purple, .blue]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            Text(dateFormatter.string(from: currentDate))
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .monospaced()
                .minimumScaleFactor(0.1)
                .padding()
        }
        .onReceive(timer) { value in
            currentDate = value
        }
    }
}

struct TimerEX_Previews: PreviewProvider {
    static var previews: some View {
        TimerEX()
    }
}
