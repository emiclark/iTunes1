import Foundation

final class HomeScreenViewModel: ObservableObject {
//  @Published var items: [HomeScreenItem]
  @Published var items: [Gist]

  init(items: [Gist]) {
    self.items = items
  }

  func onButtonTapped() {
    DataService.shared.createNewGist { result in
      switch result {
      case .success(let gists):
        for gist in gists {
          print("\(gist)\n")
        }
      case .failure(let error):
        print("\(error)")
      }
    }
  }

  func onAppear() {
    print("onAppear")
  }
    
//    let testGist = Gist(id: nil, isPublic: true, description: "Hello world")
//    do {
//      let gistData = try JSONEncoder().encode(testGist)
//      let stringData = String(data: gistData, encoding: .utf8)
//      print(stringData)
//    } catch {
//      print(">> encoding error")
//    }
//
    
//    DataService.fetchGist { result in
//      switch result {
//      case .success(let gists):
//        for gist in gists {
//          print("\(gist)\n")
//        }
//      case .failure(let error):
//        print(error)
//      }
//    }
}
//==

//  func getItems() -> [Gist] {
//    return [
//      HomeScreenItem(artistId: "1", artistName: "Abby K", artworkUrl: "X", primaryGenreName: "Blues", country: "USA"),
//      HomeScreenItem(artistId: "2", artistName: "Sumaru", artworkUrl: "X", primaryGenreName: "Rock", country: "Finland"),
//      HomeScreenItem(artistId: "3", artistName: "Oaum", artworkUrl: "X", primaryGenreName: "Electronic", country: "Canada"),
//      HomeScreenItem(artistId: "4", artistName: "Banshees", artworkUrl: "X", primaryGenreName: "Folk", country: "UK"),
//    ]
//  }
