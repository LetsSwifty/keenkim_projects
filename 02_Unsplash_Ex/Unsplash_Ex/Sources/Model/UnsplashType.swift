//
//  UnsplashType.swift
//  Unsplash_Ex
//
//  Created by KEEN on 2022/06/05.
//

import Foundation

struct UnsplashType: Decodable {
    var id: String
    var urls: Urls
}

struct Urls: Decodable {
    var regular: String
    var regularUrl: URL {
        return URL(string: regular)!
    }
}
