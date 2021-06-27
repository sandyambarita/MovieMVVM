//
//  MovieReviewResponse.swift
//  MoviesTests
//
//  Created by Sandy Ambarita on 27/06/21.
//

import XCTest
@testable import Movies

class MovieReviewResponse: XCTestCase {
    func test_get_discover_success() {
        let exp = expectation(description: "valid fetch movie review")
        let request = ListReviewVM()
        let queryParams: QueryParameters = [
            "page": "1"
        ]
        request.fetchMovieReview(id: 550, queryParams: queryParams ) { data in
            XCTAssertNotNil(data)
            XCTAssertNil(nil)
            XCTAssertEqual(550, data?.id)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        
    }
    
    func test_get_discover_error() {
        DispatchQueue.main.async {
            let exp = self.expectation(description: "invalid fetch movie detail")
            let request = MovieDetailVM()
            Endpoint.ApiKey = ["":""]
            request.fetchMovieDetail(id: 550) { data in
                XCTAssertNil(data)
                exp.fulfill()
            }
            self.waitForExpectations(timeout: 3, handler: nil)
        }
    }
}
