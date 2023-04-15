//
//  ResponseDecoderProtocol.swift
//  iTunesMusic
//
//  Created by Clark, Emiko [CWM] on 3/18/23.
//

import Foundation

public protocol ResponseDecoderProtocol {
  func decode<T: Decodable>(_ data: Data) throws -> T
}
