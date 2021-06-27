//
//  Review.swift
//  Movies
//
//  Created by Sandy Ambarita on 27/06/21.
//

import Foundation

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
