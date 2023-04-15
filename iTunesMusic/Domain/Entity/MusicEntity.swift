import Foundation

public struct MusicEntity: Equatable {
  let kind: String
  let artistId: String
  let artistName: String
  let previewUrl: String
  let artistViewUrl: String
  let artworkUrl: String
  let primaryGenreName: String
  let country: String
  let isStreamable: Bool
}
