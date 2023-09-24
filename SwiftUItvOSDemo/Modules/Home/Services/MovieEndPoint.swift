//
//  MovieEndPoint.swift
//  SwiftUItvOSDemo
//
//  Created by Yogendra Singh on 24/09/23.
//

import Foundation

enum MovieEndpoint: APIEndpoint {
    
    case getMovies(title: String)
    case getMovie(id: String)
   // https://www.omdbapi.com/?apikey=96e69064&s=batman
    var baseURL: URL {
        switch self {
        case .getMovies(let title):
            return URL(string: "https://www.omdbapi.com/?apikey=96e69064&s=\(title)")!
        case .getMovie(let id):
            return URL(string: "https://www.omdbapi.com/?apikey=96e69064&i=\(id)")!
        }
        
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return ""
        case .getMovie:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        case .getMovie:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
