import SwiftUI

struct DatePickerExample: View {
    @State var selectedDate: Date = Date()
    let start = Calendar.current.date(from: DateComponents(year: 2023))!
    let end = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("SELECTED DATE IS: ")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            
            DatePicker("Select a date", selection: $selectedDate, in: start...end, displayedComponents: [.date])
                .tint(.red)
                .datePickerStyle(.wheel)
        }
    }
}

struct DatePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerExample()
    }
}
