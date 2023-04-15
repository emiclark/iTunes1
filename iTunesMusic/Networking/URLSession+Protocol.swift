//
//  URLSessionProtocol.swift
//  iTunesMusic
//
//  Created by Clark, Emiko [CWM] on 3/18/23.
//

import Foundation

public protocol URLSessionProtocol {
  func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
  func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

final class URLSession: URLSessionProtocol {
  private let data: Data
  private let response: URLResponse
  
  public var url: URL?
  public var urlRequest = URLRequest?
  
  init(data: Data, response: URLResponse) {
    self.data = data
    self.response = response
  }
  
  func data(from url: URL, delegate _: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
    self.url = url
    return (data, response)
  }

  func data(for request: URLRequest, delegate _: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
    urlRequest = request
    return (data, response)
  }
}
