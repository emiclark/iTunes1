import SwiftUI

struct HomeScreenView: View {
  @ObservedObject var viewModel: HomeScreenViewModel
  
  init(viewModel: HomeScreenViewModel) {
    self.viewModel = viewModel
  }
  
    var body: some View {
      VStack {
        Button(
          "create new gist",
          action: viewModel.onButtonTapped
        )
      }
//      List {
//        ForEach(viewModel.items ) { item in
//          VStack {
//            HStack(alignment: .top) {
//              Text(item.id ?? "nil")
//                .font(.largeTitle)
//                .foregroundColor(.yellow).opacity(0.6)
//                .padding(2)
//
//              Text("item.isPublic")
//                .font(.body)
//                .foregroundColor(.black).opacity(0.6)
//                .padding(2)
//            }
//            Text("item.description")
//              .font(.body)
//              .padding(2)
//          }
//        }
//      }
      .onAppear {
        viewModel.onAppear()
      }
    }
}

//struct HomeView_Previews: PreviewProvider {
//  static var previews: some View {
//    HomeScreenView(
//      viewModel: HomeScreenViewModel()
//    )
//  }
//}
//      items:  [
//        HomeScreenItem(artistId: "1", artistName: "Abby K", artworkUrl: "X", primaryGenreName: "Blues", country: "USA"),
//        HomeScreenItem(artistId: "2", artistName: "Sumaru", artworkUrl: "X", primaryGenreName: "Rock", country: "Finland"),
//        HomeScreenItem(artistId: "3", artistName: "Oaum", artworkUrl: "X", primaryGenreName: "Electronic", country: "Canada"),
//        HomeScreenItem(artistId: "4", artistName: "Banshees", artworkUrl: "X", primaryGenreName: "Folk", country: "UK"),
//      ]
//                                                 ))
//  }
//}

////==
//var body: some View {
//  List {
//    ForEach(viewModel.items) { item in
//      HStack(alignment: .top) {
//        Text(item.artworkUrl)
//          .font(.largeTitle)
//          .foregroundColor(.yellow).opacity(0.6)
//          .padding(2)
//
//        VStack(alignment: .leading) {
//          Text(item.track)
//            .font(.body)
//          Text(item.artistName)
//            .font(.subheadline)
//          Text("\(item.primaryGenreName) - \(item.country)")
//            .font(.subheadline)
//        }
//      }
//    }
//  }
//  .onAppear {
//    viewModel.onAppear()
//  }
//}
//}

