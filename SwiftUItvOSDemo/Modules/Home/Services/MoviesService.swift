//
//  MoviesService.swift
//  SwiftUItvOSDemo
//
//  Created by Yogendra Singh on 24/09/23.
//

import Foundation
import Combine

protocol MoviesServiceProtocol {
    func getMovies(title: String) -> AnyPublisher<Movies, Error>
    func getMovie(id: String) -> AnyPublisher<MovieDetails, Error>
}

class MoviesService: MoviesServiceProtocol {
    let apiClient = URLSessionAPIClient<MovieEndpoint>()

    func getMovies(title: String) -> AnyPublisher<Movies, Error> {
        apiClient.request(.getMovies(title: title))
    }
    
    func getMovie(id: String) -> AnyPublisher<MovieDetails, Error> {
        apiClient.request(.getMovie(id: id))
    }
}
