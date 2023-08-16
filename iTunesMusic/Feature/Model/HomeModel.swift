import Foundation

struct Gist: Encodable, Identifiable {
  var id: String?
  var isPublic: Bool
  var description: String
  var files: [String: File]
  
  enum CodingKeys: String, CodingKey {
    case id, description, files, isPublic = "public"
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(isPublic, forKey: .isPublic)
    try container.encode(description, forKey: .description)
    try container.encodeIfPresent(id, forKey: .id)
    try container.encodeIfPresent(files, forKey: .files)
  }
}

extension Gist: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(String.self, forKey: .id)
    self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? "Description is nil"
    self.isPublic = try container.decode(Bool.self, forKey: .isPublic)
    self.files = try container.decode([String: File].self, forKey: .files)
  }
}

struct File: Codable {
  var content: String?
}


//==================
//struct HomeScreenItem: Identifiable {
//  let id: UUID = UUID()
//  let artistId: String
//  let artistName: String
//  let track: String
//  let artworkUrl: String
//  let primaryGenreName: String
//  let country: String
//
//  init(
//    artistId: String,
//    artistName: String,
//    track: String = "Track name",
//    artworkUrl: String,
//    primaryGenreName: String,
//    country: String
//  ) {
//    self.artistId = artistId
//    self.artistName = artistName
//    self.track = track
//    self.artworkUrl = artworkUrl
//    self.primaryGenreName = primaryGenreName
//    self.country = country
//  }
//}
