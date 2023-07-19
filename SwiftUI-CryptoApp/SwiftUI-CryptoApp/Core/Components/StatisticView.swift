import SwiftUI

struct StatisticView: View {
  let stat: StatisticModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(stat.title)
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
      
      Text(stat.value)
        .font(.headline)
        .foregroundColor(.theme.accent)
      HStack {
        Image(systemName: "triangle.fill")
          .font(.caption2)
          .rotationEffect(.degrees(
            (stat.percentageChange ?? 0) >= 0
            ? 0
            : 180
          ))
        
        Text(stat.percentageChange?.asPercentString ?? "")
          .font(.caption)
          .bold()
      }
      .foregroundColor(
        (stat.percentageChange ?? 0) >= 0
        ? .theme.green
        : .theme.red
      )
      .opacity(stat.percentageChange == nil ? .zero : 1.0)
    }
  }
}

struct StatisticView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      StatisticView(stat: dev.state1)
      StatisticView(stat: dev.state2)
      StatisticView(stat: dev.state3)
    }
    .previewLayout(.sizeThatFits)
  }
}
