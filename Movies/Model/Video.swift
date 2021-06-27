//
//  Video.swift
//  Movies
//
//  Created by Sandy Ambarita on 27/06/21.
//

import Foundation

struct MovieVideo: Codable {
    var id: Int?
    var results: [MovieVideoData]?
}

struct MovieVideoData: Codable {
    var id: String?
    var key: String?
    var name: String?
}
