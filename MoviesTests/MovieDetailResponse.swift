//
//  MovieDetailResponse.swift
//  MoviesTests
//
//  Created by Sandy Ambarita on 27/06/21.
//

//import XCTest
//@testable import Movies
//
//class MovieDetailResponse: XCTestCase {
//    func test_get_discover_success() {
//        let exp = expectation(description: "valid fetch movie")
//        let request = MovieDetailVM()
//       
//        request.fetchMovieDetail(id: 550) { data in
//            XCTAssertNotNil(data)
//            XCTAssertNil(nil)
//            XCTAssertEqual("Fight Club", data?.originalTitle)
//            exp.fulfill()
//        }
//        waitForExpectations(timeout: 3)
//        
//    }
//    
//    func test_get_discover_error() {
//        DispatchQueue.main.async {
//            let exp = self.expectation(description: "invalid fetch movie detail")
//            let request = MovieDetailVM()
//            Endpoint.ApiKey = ["":""]
//            request.fetchMovieDetail(id: 550) { data in
//                XCTAssertNil(data)
//                exp.fulfill()
//            }
//            self.waitForExpectations(timeout: 3, handler: nil)
//        }
//    }
//}
