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
    var baseURL: URL {
        return URL(string: "https://www.omdbapi.com/?apikey=96e69064")!
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return ""
        case .getMovie:
            return ""
        }
    }
    
    var queryParameters: [URLQueryItem]? {
        switch self {
        case .getMovies(let title):
            return [URLQueryItem(name: "s", value: title)]
        case .getMovie(let id):
            return [URLQueryItem(name: "i", value: id)]
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
