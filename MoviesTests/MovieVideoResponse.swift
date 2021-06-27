//
//  MovieVideoResponse.swift
//  MoviesTests
//
//  Created by Sandy Ambarita on 27/06/21.
//

import XCTest
@testable import Movies

class MovieVideoResponse: XCTestCase {
    func test_get_video_success() {
        let exp = expectation(description: "valid fetch video")
        let request = MovieDetailVM()
       
        request.fetchMovieVideo(id: 550) { data in
            XCTAssertNotNil(data)
            XCTAssertNil(nil)
            XCTAssertEqual("Fight Club | #TBT Trailer | 20th Century FOX", data?.first?.name)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        
    }
    
    func test_get_video_error() {
        DispatchQueue.main.async {
            let exp = self.expectation(description: "invalid fetch video")
            let request = MovieDetailVM()
            Endpoint.ApiKey = ["":""]
            request.fetchMovieVideo(id: 550) { data in
                XCTAssertNil(data)
                exp.fulfill()
            }
            self.waitForExpectations(timeout: 3, handler: nil)
        }
    }
}
