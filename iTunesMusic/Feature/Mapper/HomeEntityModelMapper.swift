  import Foundation

  protocol HomeEntityModelMapperProtocol {
    func map(from source: MusicEntity) -> HomeModel
  }

final class HomeEntityModelMapper: HomeEntityModelMapperProtocol {
  func map(from source: MusicEntity) -> HomeModel {
    .init(
      kind: source.kind,
      artistId: source.artistId,
      artistName: source.artistName,
      previewUrl: source.previewUrl,
      artistViewUrl: source.artworkUrl,
      artworkUrl: source.artworkUrl,
      primaryGenreName: source.primaryGenreName,
      country: source.country,
      isStreamable: source.isStreamable
    )
  }
}
