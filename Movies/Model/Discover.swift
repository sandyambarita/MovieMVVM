//
//  Discover.swift
//  Movies
//
//  Created by Sandy Ambarita on 27/06/21.
//

import Foundation

struct Discover: Codable {
    let page: Int?
    let results: [DiscoverData]?
    let totalPages: Int?
    let totalResults: Int?
    
    public enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct DiscoverData: Codable {
    var id: Int?
    var title: String?
    var backdropPath: String?
    var posterPath: String?
    var releaseDate: String?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case title
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
