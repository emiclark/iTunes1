//
//  NetworkError.swift
//  iTunesMusic
//
//  Created by Clark, Emiko [CWM] on 3/18/23.
//

import Foundation

public enum NetworkError: Error, Equatable {
  case invalidURL(url: String)
}
