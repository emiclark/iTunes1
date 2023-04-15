import SwiftUI

struct HomeScreen: View {
  @ObservedObject var viewModel: HomeScreenViewModel
  
  init(viewModel: HomeScreenViewModel) {
    self.viewModel = viewModel
  }
  
    var body: some View {
      VStack {
        Text("Artist name: \(viewModel.artistName)")
        Text("Country: \(viewModel.country)")
        Text("Genre: \(viewModel.primaryGenreName)")
      }
      .onAppear(perform: viewModel.onAppear())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: HomeScreenViewModel(artistId: 1, artistName: "Kenny G", primaryGenreName: "Blues", country: "USA", isStreamable: false))
    }
}
