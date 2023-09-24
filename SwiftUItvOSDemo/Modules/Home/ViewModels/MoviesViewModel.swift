//
//  MoviesViewModel.swift
//  SwiftUItvOSDemo
//
//  Created by Yogendra Singh on 24/09/23.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    let movieService: MoviesServiceProtocol
    @Published var movies: [Movie] = []
    @Published var movieDetails: MovieDetails?
    @Published var errorMessage: String?
    
    init(movieService: MoviesServiceProtocol) {
        self.movieService = movieService
    }
    
    func fetchMovies(title: String) {
        movieService.getMovies(title: title)
            .receive(on: RunLoop.main)
            .sink { [weak self] error in
                guard let weakSelf = self else { return }
                switch error {
                case .finished: break
                case .failure(let error):
                    weakSelf.errorMessage = error.localizedDescription
                }
            } receiveValue: {[weak self] movies in
                guard let weakSelf = self else { return }
                weakSelf.movies = movies.search
            }
            .store(in: &cancellables)
    }
    
    func fetchMovie(id: String) {
        movieService.getMovie(id: id)
            .receive(on: RunLoop.main)
            .sink { [weak self] error in
                guard let weakSelf = self else { return }
                switch error {
                case .finished: break
                case .failure(let error):
                    weakSelf.errorMessage = error.localizedDescription
                }
            } receiveValue: {[weak self] movie in
                guard let weakSelf = self else { return }
                weakSelf.movieDetails = movie
            }
            .store(in: &cancellables)
    }
}
