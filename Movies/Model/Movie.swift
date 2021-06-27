//
//  Movie.swift
//  Movies
//
//  Created by Sandy Ambarita on 27/06/21.
//

import Foundation

struct MovieDetail: Codable {
    var backdropPath: String?
    var posterPath: String?
    var originalTitle: String?
    var overview: String?
    var voteAverage: Double?
    var releaseDate: String?
    var status: String?
    
    public enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case overview
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case status
    }
}
