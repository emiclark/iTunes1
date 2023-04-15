import Foundation

struct MusicData: Decodable, Equatable {
  let kind: String
  let artistId: String
  let artistName: String
  let previewUrl: String
  let artistViewUrl: String
  let artworkUrl: String
  let primaryGenreName: String
  let country: String
  let isStreamable: Bool
  
  init(
    kind: String,
    artistId: String,
    artistName: String,
    previewUrl: String,
    artistViewUrl: String,
    artworkUrl: String,
    primaryGenreName: String,
    country: String,
    isStreamable: Bool
  ) {
    self.kind = kind
    self.artistId = artistId
    self.artistName = artistName
    self.previewUrl = previewUrl
    self.artistViewUrl = artistViewUrl
    self.primaryGenreName = primaryGenreName
    self.country = country
    self.isStreamable = isStreamable
  }
}
