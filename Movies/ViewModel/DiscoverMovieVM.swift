//
//  DiscoverMovieVM.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation

class DiscoverMovieVM {
    
    var discoverData: [DiscoverData] = []
    var apimanager = APIManager()
    
    func fetchDiscover(queryParams: [String : String], completion: @escaping(Discover?) -> ()) {
        apimanager.fetchDiscoverMovie(queryParams: queryParams) { (data) in
            if data != nil {
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(Discover.self, from: data!)
                    self.discoverData.append(contentsOf: data.results!)
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
        return self.discoverData.count
    }
    
    func discoverAtIndex(index: Int) -> DiscoverData {
        let discover = self.discoverData[index]
        return discover
    }
    
}
