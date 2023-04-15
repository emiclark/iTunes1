//
//  NetworkClient.swift
//  iTunesMusic
//
//  Created by Clark, Emiko [CWM] on 3/18/23.
//

import Foundation

public protocol NetworkClientProtocol {
  func executeRequest(_ request: NetworkRequest) async throws -> NetworkResponse
}

public class NetworkClient: NetworkClientProtocol {
  let baseURL: URL
  private let urlSession: URLSessionProtocol
  
  public init(
    baseURL: URL,
    urlSession: URLSessionProtocol
  ) {
    self.baseURL = baseURL
    self.urlSession = urlSession
  }
  
  public func executeRequest(_ request: NetworkRequest) async throws -> NetworkResponse {
    let result = try await execute(request)
    print(String(data: result.data, encoding: .utf8))
    return NetworkResponse(data: result.data, response: result.response)
  }
}

private extension NetworkClient {
  func execute(_ networkRequest: NetworkRequest) async throws -> (data: Data, response: URLResponse) {
    guard let url = URL(string: networkRequest.endpoint, relativeTo: baseURL) else {
      throw NetworkError.invalidURL(url: networkRequest.endpoint)
    }

    let urlRequest = {
      var request = URLRequest(url: url)
      request.httpMethod = networkRequest.method
      if let body = networkRequest.body {
        request.httpBody = body
      }
      return request
    }()
    return try await urlSession.data(for: urlRequest, delegate: nil)
  }
}
