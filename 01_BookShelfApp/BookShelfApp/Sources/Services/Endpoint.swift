//
//  Endpoint.swift
//  BookShelfApp
//
//  Created by KEEN on 2022/05/08.
//

import Foundation

enum Endpoint {
  case searchBook
}

extension URL {
  static let baseURL = "https://openapi.naver.com/v1"
  static func makeEndpoint(_ endpoint: String) -> URL {
    URL(string: baseURL + endpoint)!
  }
}

extension Endpoint {
  var url: URL {
    switch self {
    case .searchBook:
      return .makeEndpoint("/search/book.json")
    }
  }
}
