//
//  Gendres.swift
//  Gendres
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation

struct Genres: Codable {
    let genres: [GenreData]?
    
    public enum CodingKeys: String, CodingKey {
        case genres
    }
}

struct GenreData: Codable {
    let id: Int?
    let name: String?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
