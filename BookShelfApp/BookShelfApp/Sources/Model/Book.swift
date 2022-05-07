//
//  Book.swift
//  BookShelfApp
//
//  Created by KEEN on 2022/05/08.
//

import Foundation

struct Book: Decodable {
  var image: String
  var title: String
  var author: String
  var price: String
  var link: String
}

struct BookInfo: Decodable {
  let items: [Book]
  let total: Int
}

extension Book {
  func toBook() -> Book {
    let title = removeTags(title)
    let author = removeTags(author)

    return Book(
      image: image,
      title: title,
      author: author,
      price: price,
      link: link)
  }
}

private func removeTags(_ string: String) -> String {
  return string
    .replacingOccurrences(of: "<b>", with: "")
    .replacingOccurrences(of: "</b>", with: "")
    .replacingOccurrences(of: "|", with: "")
    .replacingOccurrences(of: "&amp;", with: "&")
}
