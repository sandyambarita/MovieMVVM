//
//  GenreApiResponse.swift
//  MoviesTests
//
//  Created by Sandy Ambarita on 27/06/21.
//

import XCTest
@testable import Movies

class GenreApiResponse: XCTestCase {
    func test_getGenre_success() {
        let exp = expectation(description: "valid fetch genre")
        let request = OfficialGenresVM()
        request.fetchListGenres { data in
            XCTAssertNotNil(data)
            XCTAssertNil(nil)
            XCTAssertEqual("Action", data?.genres?.first?.name)
            XCTAssertEqual(28, data?.genres?.first?.id)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        
    }
    
    func test_getGenre_error() {
        DispatchQueue.main.async {
            let exp = self.expectation(description: "invalid fetch genre")
            let request = OfficialGenresVM()
            Endpoint.ApiKey = ["":""]
            request.fetchListGenres { data in
                XCTAssertNil(data?.genres)
                exp.fulfill()
            }
            self.waitForExpectations(timeout: 3)
        }
        
    }
}
