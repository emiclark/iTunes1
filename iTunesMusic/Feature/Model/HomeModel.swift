import Foundation

struct HomeScreenItem: Identifiable {
  let id: UUID = UUID()
  let artistId: String
  let artistName: String
  let track: String
  let artworkUrl: String
  let primaryGenreName: String
  let country: String
  
  init(
    artistId: String,
    artistName: String,
    track: String = "Track name",
    artworkUrl: String,
    primaryGenreName: String,
    country: String
  ) {
    self.artistId = artistId
    self.artistName = artistName
    self.track = track
    self.artworkUrl = artworkUrl
    self.primaryGenreName = primaryGenreName
    self.country = country
  }
}
