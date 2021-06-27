//
//  Gendres.swift
//  Gendres
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation

struct Genres: Codable {
    let genres: [GenreData]?
}

struct GenreData: Codable {
    let id: Int?
    let name: String?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

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

struct MovieReview: Codable {
    var id: Int?
    var page: Int?
    var results: [MovieReviewData]?
    var totalPages: Int?
    var totalResults: Int?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieReviewData: Codable {
    var author: String?
    var content: String?
    var url: String?
    var authorDetails: AuthorDetailData?
            
    public enum CodingKeys: String, CodingKey {
        case author
        case content
        case url
        case authorDetails = "author_details"
    }
}

struct AuthorDetailData: Codable {
    var username: String?
    var avatarPath: String?
    
    public enum CodingKeys: String, CodingKey {
        case username
        case avatarPath = "avatar_path"
    }
}

struct MovieVideo: Codable {
    var id: Int?
    var results: [MovieVideoData]?
}

struct MovieVideoData: Codable {
    var id: String?
    var key: String?
    var name: String?
}
