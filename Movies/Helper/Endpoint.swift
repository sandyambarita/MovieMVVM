//
//  Endpoint.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation

open class Endpoint {
    static var ApiKey: QueryParameters = ["api_key":"84ad5168fceebc18314c22d2e7e6378e"]
    static let BaseEndpoint = "https://api.themoviedb.org/3"
    static let BaseImage = "https://image.tmdb.org/t/p/w500"
    
    static let OFFICIAL_GENRE = "/genre/movie/list"
    static let DISCOVER_MOVIE = "/discover/movie/"
    static let MOVIE_DETAIL = "/movie/"
    static let MOVIE_REVIEW = "/reviews"
    static let MOVIE_VIDEO = "/videos"
    
    
}
