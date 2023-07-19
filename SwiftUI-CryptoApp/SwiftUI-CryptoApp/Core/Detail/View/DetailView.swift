import SwiftUI

struct DetailLoadingView: View {
  @Binding var coin: CoinModel?
  
  var body: some View {
    ZStack {
      if let coin {
        Text(coin.name)
      }
    }
  }
}

struct DetailView: View {
  @StateObject var vm: DetailViewModel
  @State private var showFullDescription = false
  
  private let columns: [GridItem] = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  private let spacing: CGFloat = 30
  
  init(coin: CoinModel) {
    _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
  }
  
  
  var body: some View {
    ScrollView {
      VStack {
        ChartView(coin: vm.coin)
        
        VStack(spacing: 20) {
          overviewTitle
          Divider()
          descriptionSection
          overviewGrid
          addtionalTitle
          Divider()
          addtionalGrid
          links
        }
        .padding()
      }
    }
    .background(Color.theme.background.ignoresSafeArea())
    .padding()
    .navigationTitle(vm.coin.name)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        navigationBarTrailingItems
      }
    }
  }
}

private extension DetailView {
  var navigationBarTrailingItems: some View {
    HStack {
      Text(vm.coin.symbol.uppercased())
        .font(.headline)
        .foregroundColor(.theme.secondaryText)
      CoinImageView(coin: vm.coin)
        .frame(width: 25, height: 25)
    }
  }
  
  var overviewTitle: some View {
    Text("Overview")
      .font(.title)
      .bold()
      .foregroundColor(.theme.accent)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var addtionalTitle: some View {
    Text("Addtional Details")
      .font(.title)
      .bold()
      .foregroundColor(.theme.accent)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var descriptionSection: some View {
    ZStack {
      if let coinDescriptoin = vm.coinDescription, !coinDescriptoin.isEmpty {
        
        VStack(alignment: .leading) {
          Text(coinDescriptoin)
            .lineLimit(showFullDescription ? nil : 3)
            .font(.callout)
            .foregroundColor(.theme.secondaryText)
          
          Button {
            withAnimation(.easeInOut) {
              showFullDescription.toggle()
            }
          } label: {
            Text(showFullDescription ? "Less" : "Read more...")
              .font(.caption)
              .fontWeight(.bold)
              .padding(.vertical, 4)
          }
          .tint(.blue)
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
  }
  
  var overviewGrid: some View {
    LazyVGrid(
      columns: columns,
      alignment: .center,
      spacing: spacing,
      pinnedViews: []
    ) {
      ForEach(vm.overviewStatistics) { stat in
        StatisticView(stat: stat)
      }
    }
  }
  
  var addtionalGrid: some View {
    LazyVGrid(
      columns: columns,
      alignment: .center,
      spacing: spacing,
      pinnedViews: []
    ) {
      ForEach(vm.additionalStatistics) { stat in
        StatisticView(stat: stat)
      }
    }
  }
  
  var links: some View {
    VStack(alignment: .leading, spacing: 20) {
      if let websiteString = vm.websiteURL, let url = URL(string: websiteString) {
        Link("Website", destination: url)
        
      }
      
      if let redditString = vm.websiteURL, let url = URL(string: redditString) {
        Link("Reddit", destination: url)
      }
      
    }
    .tint(.blue)
    .frame(maxWidth: .infinity, alignment: .leading)
    .font(.headline)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      DetailView(coin: dev.coin)
    }
  }
}
