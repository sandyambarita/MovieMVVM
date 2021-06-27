//
//  DiscoverApiResponse.swift
//  MoviesTests
//
//  Created by Sandy Ambarita on 27/06/21.
//

import XCTest
@testable import Movies

class DiscoverApiResponse: XCTestCase {
    func test_get_discover_success() {
        let exp = expectation(description: "valid fetch discover")
        let request = DiscoverMovieVM()
        let queryParams: QueryParameters = [
            "with_genres": "28",
            "page": "1"
        ]
        request.fetchDiscover(queryParams: queryParams!) { data in
            XCTAssertNotNil(data)
            XCTAssertNil(nil)
            XCTAssertEqual("Infinite", data?.results?[0].title)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        
    }
    
    func test_get_discover_error() {
        DispatchQueue.main.async {
            let exp = self.expectation(description: "valid fetch discover")
            let request = DiscoverMovieVM()
            let queryParams: QueryParameters = [
                "with_genres": "28",
                "page": "1"
            ]
            Endpoint.ApiKey = ["":""]
            request.fetchDiscover(queryParams: queryParams!) { data in
                XCTAssertNil(data)
                XCTAssertNil(data?.results)
                exp.fulfill()
            }
            self.waitForExpectations(timeout: 3, handler: nil)
        }
    }
}
