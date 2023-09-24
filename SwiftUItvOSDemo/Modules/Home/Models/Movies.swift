//
//  Movies.swift
//  SwiftUItvOSDemo
//
//  Created by Yogendra Singh on 24/09/23.
//

import Foundation

struct Movies: Codable {
    var search: [Movie]
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

struct Movie: Codable, Hashable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year  = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
