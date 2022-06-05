//
//  String++Extension.swift
//  BookShelfApp
//
//  Created by KEEN on 2022/05/08.
//

import Foundation

extension String {
  var checkIsEmpty: String {
    if self.isEmpty {
      return "정보 없음"
    } else {
      return self
    }
  }
}
