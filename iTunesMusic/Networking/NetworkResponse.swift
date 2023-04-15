import Foundation

public struct NetworkResponse {
  public let data: Data
  public let response: URLResponse
}

public extension NetworkResponse {
  func decode<T: Decodable>(_ decoder: ResponseDecoderProtocol) throws -> T {
    try decoder.decode(data)
  }
}
