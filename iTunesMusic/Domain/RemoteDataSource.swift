import Foundation
import SwiftUI

protocol RemoteDataSourceProtocol {
  func getMusic(for artist: String) async throws -> MusicDataResponse
}

enum Endpoints {
  static var music: String { "https://itunes.apple.com/search?term=music&limit=10&entity=music"
  }
}

final class RemoteDataSource: RemoteDataSourceProtocol {
  private let networkClient: NetworkClientProtocol
  private let responseDecoder: ResponseDecoderProtocol
  @State private var data: MusicData?
  
  init(
    networkClient: NetworkClientProtocol,
    responseDecoder: ResponseDecoderProtocol
  ) {
    self.networkClient = networkClient
    self.responseDecoder = responseDecoder
  }
  
  func getMusic(for artist: String) async throws -> MusicDataResponse {
    guard let url = URL(string: Endpoints.music) else {
      throw NetworkError.invalidURL(url: Endpoints.music)
    }
    
      .task {
        do {
          var request = URLRequest(url: url)
          let (data, response) = try await URLSession.shared.urlRequest .data(from: url)
          self.data = data
        } catch {
          print("error")
        }
      }
  }
}
