import SwiftUI

struct CoinRowView: View {
  let coin: CoinModel
  let showHoldingsColumn: Bool
  
  var body: some View {
    HStack(spacing: 0) {
      leftColumn
      Spacer()
      
      if showHoldingsColumn {
        centerColumn
      }
      
      rightColumn
    }
    .font(.subheadline)
    .background(
      Color.theme.background.opacity(0.001)
    )
  }
}

private extension CoinRowView {
  @ViewBuilder
  var leftColumn: some View {
    Text("\(coin.rank)")
      .font(.caption)
      .foregroundColor(.theme.secondaryText)
      .frame(minWidth: 30)
    CoinImageView(coin: coin)
      .frame(width: 30, height: 30)
    Text(coin.symbol.uppercased())
      .font(.headline)
      .padding(.leading, 6)
      .foregroundColor(.theme.accent)
  }
  
  var centerColumn: some View {
    VStack(alignment: .trailing) {
      Text(coin.currentHoldingValues.asCurrencyWith2Decimals)
        .bold()
      Text((coin.currentHoldings ?? 0).asNumberString)
    }
    .foregroundColor(.theme.accent)
  }
  
  var rightColumn: some View {
    VStack(alignment: .trailing) {
      Text(coin.currentPrice.asCurrencyWith6Decimals)
        .bold()
        .foregroundColor(.theme.accent)
      Text(coin.priceChangePercentage24H?.asPercentString ?? "")
        .foregroundColor(
          (coin.priceChangePercentage24H ?? 0) >= 0 ?
          Color.theme.green :
            Color.theme.red
        )
    }
    .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
  }
  
}

struct CoinRowView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CoinRowView(coin: dev.coin, showHoldingsColumn: true)
        .previewLayout(.sizeThatFits)
      
      CoinRowView(coin: dev.coin, showHoldingsColumn: true)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
  }
}
