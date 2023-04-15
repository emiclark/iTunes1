import Foundation

protocol MusicDataEntityMapperProtocol {
  func map(from source: MusicData) -> MusicEntity
}

struct HomeDataEntityMapper: MusicDataEntityMapperProtocol {
  func map(from source: MusicData) -> MusicEntity {
    MusicEntity(
      kind: source.kind,
      artistId: source.artistId,
      artistName: source.artistName,
      previewUrl: source.previewUrl,
      artistViewUrl: source.artistViewUrl,
      artworkUrl: source.artworkUrl,
      primaryGenreName: source.primaryGenreName,
      country: source.country,
      isStreamable: source.isStreamable
    )
  }
}

