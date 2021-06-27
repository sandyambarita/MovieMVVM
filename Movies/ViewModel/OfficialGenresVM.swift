//
//  OfficialGendresVM.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation

class OfficialGenresVM {
    
    var genreData: [GenreData] = []
    var genre: Genres?
    var apimanager = APIManager()
    
    func fetchListGenres(completion: @escaping(Genres?) -> ()) {
        apimanager.fetchListGenres() { (data) in
            if data != nil {
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(Genres.self, from: data!)
                    self.genreData = data.genres!
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
        return self.genreData.count
    }
    
    func genreAtIndex(index: Int) -> GenreData {
        let genre = self.genreData[index]
        return genre
    }
    
}


