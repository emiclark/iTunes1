//
//  NetworkRequest.swift
//  iTunesMusic
//
//  Created by Clark, Emiko [CWM] on 3/18/23.
//

import Foundation

public struct NetworkRequest {
  public let endpoint: String
  public let method: String
  public let body: Data?
  public let headers: [String: String]?

  public init(
    endpoint: String,
    method: String,
    body: Data? = nil,
    headers: [String: String]? = nil
  ) {
    self.endpoint = endpoint
    self.method = method
    self.body = body
    self.headers = headers
  }
}
