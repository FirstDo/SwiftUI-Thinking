
import SwiftUI

struct ChartView: View {
  
  private let data: [Double]
  private let maxY: Double
  private let minY: Double
  private let lineColor: Color
  private let startDate: Date
  private let endingDate: Date
  
  @State private var percentage: CGFloat = .zero
  
  init(coin: CoinModel) {
    self.data = coin.sparklineIn7D.price
    self.maxY = data.max() ?? .zero
    self.minY = data.min() ?? .zero
    
    let priceChange = (data.last ?? .zero) - (data.first ?? .zero)
    
    self.lineColor = priceChange > 0 ? .theme.green : .theme.red
    self.endingDate = Date(coinGeckoString: coin.lastUpdated)
    self.startDate = endingDate.addingTimeInterval(-7*24*60*60)
  }
  
  var body: some View {
    VStack {
      chart
        .frame(height: 200)
        .background(chartBackground)
        .overlay(alignment: .leading) {
          chartYAxis.padding(.horizontal, 4)
        }
      
      dateLabel
        .padding(.horizontal, 4)
    }
    .font(.caption)
    .foregroundColor(.theme.secondaryText)
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        withAnimation(.linear) {
          percentage = 1.0
        }
      }
    }
  }
}

private extension ChartView {
  var chart: some View {
    GeometryReader { geometry in
      Path { path in
        for index in data.indices {
          let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
          
          let yAxis = maxY - minY
          let yPosition = (1 - (data[index] - minY) / yAxis) * geometry.size.height
          
          if index == 0 {
            path.move(to: CGPoint(x: 0, y: 0))
          }
          
          path.addLine(to: CGPoint(x: xPosition, y: yPosition))
        }
      }
      .trim(from: 0, to: percentage)
      .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
      .shadow(color: lineColor, radius: 10, x: 0, y: 10)
      .shadow(color: lineColor.opacity(0.5), radius: 10, x: 0, y: 20)
      .shadow(color: lineColor.opacity(0.2), radius: 10, x: 0, y: 30)
      .shadow(color: lineColor.opacity(0.1), radius: 10, x: 0, y: 40)
    }
  }
  
  var chartBackground: some View {
    VStack {
      Divider()
      Spacer()
      Divider()
      Spacer()
      Divider()
    }
  }
  
  var chartYAxis: some View {
    VStack {
      Text(maxY.formattedWithAbbreviations)
      Spacer()
      Text(((maxY + minY) / 2).formattedWithAbbreviations)
      Spacer()
      Text(minY.formattedWithAbbreviations)
    }
  }
  
  var dateLabel: some View {
    HStack {
      Text(startDate.asShortDateString)
      Spacer()
      Text(endingDate.asShortDateString)
    }
  }
}

struct ChartView_Previews: PreviewProvider {
  static var previews: some View {
    ChartView(coin: dev.coin)
  }
}
