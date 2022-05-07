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
