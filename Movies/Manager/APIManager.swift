//
//  APIMovies.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation

class APIManager {
    
    func fetchListGenres(completionHandler: @escaping (Data?) -> ()){
        var urlComponents = URLComponents(string: "\(Endpoint.BaseEndpoint)\(Endpoint.OFFICIAL_GENRE)")!
        urlComponents.setQueryItems(with: Endpoint.ApiKey!)
        let resultUrl = urlComponents.url!.absoluteString
        Connection.request(.get, url: "\(resultUrl)") { (data, statusCode, error) in
            if error == nil {
                if statusCode == 200 {
                    completionHandler(data)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func fetchDiscoverMovie(queryParams: [String:String], completionHandler: @escaping (Data?) -> ()){
        var urlComponents = URLComponents(string: "\(Endpoint.BaseEndpoint)\(Endpoint.DISCOVER_MOVIE)")!
        let mergingDict = Endpoint.ApiKey!.merging(queryParams) { (current, _) in current }
        urlComponents.setQueryItems(with: mergingDict)
        let resultUrl = urlComponents.url!.absoluteString
        Connection.request(.get, url: "\(resultUrl)") { (data, statusCode, error) in
            if error == nil {
                if statusCode == 200 {
                    completionHandler(data)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func fetchMovieDetail(id: Int, completionHandler: @escaping (Data?) -> ()){
        var urlComponents = URLComponents(string: "\(Endpoint.BaseEndpoint)\(Endpoint.MOVIE_DETAIL)\(id)")!
        urlComponents.setQueryItems(with: Endpoint.ApiKey!)
        let resultUrl = urlComponents.url!.absoluteString
        Connection.request(.get, url: "\(resultUrl)") { (data, statusCode, error) in
            if error == nil {
                if statusCode == 200 {
                    completionHandler(data)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func fetchMovieReview(id: Int, queryParams: [String:String], completionHandler: @escaping (Data?) -> ()){
        var urlComponents = URLComponents(string: "\(Endpoint.BaseEndpoint)\(Endpoint.MOVIE_DETAIL)\(id)\(Endpoint.MOVIE_REVIEW)")!
        let mergingDict = Endpoint.ApiKey!.merging(queryParams) { (current, _) in current }
        urlComponents.setQueryItems(with: mergingDict)
        let resultUrl = urlComponents.url!.absoluteString
        Connection.request(.get, url: "\(resultUrl)") { (data, statusCode, error) in
            if error == nil {
                if statusCode == 200 {
                    completionHandler(data)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func fetchMovieVideo(id: Int, completionHandler: @escaping (Data?) -> ()){
        var urlComponents = URLComponents(string: "\(Endpoint.BaseEndpoint)\(Endpoint.MOVIE_DETAIL)\(id)\(Endpoint.MOVIE_VIDEO)")!
        urlComponents.setQueryItems(with: Endpoint.ApiKey!)
        let resultUrl = urlComponents.url!.absoluteString
        Connection.request(.get, url: "\(resultUrl)") { (data, statusCode, error) in
            if error == nil {
                if statusCode == 200 {
                    completionHandler(data)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
}
