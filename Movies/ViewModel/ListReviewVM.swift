//
//  ListReviewVM.swift
//  Movies
//
//  Created by Sandy Ambarita on 27/06/21.
//

import Foundation

class ListReviewVM {
    
    var listReview = [MovieReviewData]()
    var apimanager = APIManager()
    
    func fetchMovieReview(id: Int, queryParams: QueryParameters, completion: @escaping(MovieReview?) -> ()) {
        apimanager.fetchMovieReview(id: id, queryParams: queryParams!) { (data) in
            if data != nil {
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(MovieReview.self, from: data!)
                    self.listReview.append(contentsOf: data.results!)
                    completion(data)
                } catch {
                    print("error trying to convert data to JSON: \(error)")
                }
            } else {
                print("nil")
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return self.listReview.count
    }
    
    func discoverAtIndex(index: Int) -> MovieReviewData {
        let listReview = self.listReview[index]
        return listReview
    }
    
}
