import Foundation

extension Date {
  init(coinGeckoString: String) {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let date = formatter.date(from: coinGeckoString) ?? .now
    self.init(timeInterval: 0, since: date)
  }
  
  private var shortFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
  }
  
  var asShortDateString: String {
    return shortFormatter.string(from: self)
  }
}
