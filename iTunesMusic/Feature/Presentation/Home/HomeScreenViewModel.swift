import Foundation

final class HomeScreenModel: ObservableObject {
  let artistId: Int
  let artistName: String
  let primaryGenreName: String
  let artist
  let country: String
  
  init(
    artistId: Int,
    artistName: String,
    primaryGenreName: String,
    country: String,
    isStreamable: Bool
  ) {
    self.artistName = artistName
    self.primaryGenreName = primaryGenreName
    self.country = country
    self.isStreamable = isStreamable
  }
}

extension HomeScreenModel {
  var mock: HomeScreenModel {
    HomeScreenModel(
      artistId: 1,
      artistName: "Kenny G",
      primaryGenreName: "Blues",
      country: "USA",
      isStreamable: false
    )
  }
}
