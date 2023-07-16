import Foundation

final class HomeScreenViewModel: ObservableObject {
  @Published var items: [HomeScreenItem]

  init(items: [HomeScreenItem]) {
    self.items = items
  }

  func onAppear() {
    items = getItems()
  }

  func getItems() -> [HomeScreenItem] {
    return [
      HomeScreenItem(artistId: "1", artistName: "Abby K", artworkUrl: "X", primaryGenreName: "Blues", country: "USA"),
      HomeScreenItem(artistId: "2", artistName: "Sumaru", artworkUrl: "X", primaryGenreName: "Rock", country: "Finland"),
      HomeScreenItem(artistId: "3", artistName: "Oaum", artworkUrl: "X", primaryGenreName: "Electronic", country: "Canada"),
      HomeScreenItem(artistId: "4", artistName: "Banshees", artworkUrl: "X", primaryGenreName: "Folk", country: "UK"),
    ]
  }
}
