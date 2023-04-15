import Foundation

struct MusicDataResponse: Decodable {
  let music: [MusicData]
  
  enum CodingKeys: String, CodingKey {
   case results
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let dataContainer = try container.nestedContainer(
      keyedBy: CodingKeys.self,
      forKey: .results
    )
    self.music = try dataContainer.decode([MusicData].self, forKey: .results)
  }
}

#if DEBUG
extension MusicDataResponse {
  init(music: [MusicData]) {
    self.music = music
  }
}
#endif
