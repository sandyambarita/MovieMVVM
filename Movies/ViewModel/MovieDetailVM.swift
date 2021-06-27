//
//  MovieDetailVM.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation

class MovieDetailVM {
    
    var movieDetail: MovieDetail?
    var movieReview = [MovieReviewData]()
    var movieVideo = [MovieVideoData]()
    var apimanager = APIManager()
    
    func fetchMovieDetail(id: Int, completion: @escaping(MovieDetail?) -> ()) {
        apimanager.fetchMovieDetail(id: id) { (data) in
            if data != nil {
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(MovieDetail.self, from: data!)
                    self.movieDetail = data
                    completion(self.movieDetail)
                } catch {
                    print("error trying to convert data to JSON: \(error)")
                }
            } else {
                print("nil")
            }
        }
    }
    
    func fetchMovieReview(id: Int, queryParams: QueryParameters, completion: @escaping([MovieReviewData]?) -> ()) {
        apimanager.fetchMovieReview(id: id, queryParams: queryParams!) { (data) in
            if data != nil {
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(MovieReview.self, from: data!)
                    self.movieReview = data.results ?? []
                    print(self.movieReview)
                    completion(self.movieReview)
                } catch {
                    print("error trying to convert data to JSON: \(error)")
                }
            } else {
                print("nil")
            }
        }
    }
    
    func fetchMovieVideo(id: Int, completion: @escaping([MovieVideoData]?) -> ()) {
        apimanager.fetchMovieVideo(id: id) { (data) in
            if data != nil {
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(MovieVideo.self, from: data!)
                    self.movieVideo = data.results!
                    completion(self.movieVideo)
                } catch {
                    print("error trying to convert data to JSON: \(error)")
                }
            } else {
                print("nil")
            }
        }
    }
    
    func numberOfRowsInSectionVideo() -> Int {
        return self.movieVideo.count
    }
    
    func genreAtIndexVideo(index: Int) -> MovieVideoData {
        let movieVideo = self.movieVideo[index]
        return movieVideo
    }
}
