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
    var networkStatus = Network.reachability.status
    @Published var movies: [Movie] = []
    @Published var movieDetails: MovieDetails?
    @Published var errorMessage: String?
    
    init(movieService: MoviesServiceProtocol) {
        self.movieService = movieService
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(statusManager),
                         name: .flagsChanged,
                         object: nil)
    }
    
    func fetchMovies(title: String) {
        guard Network.isConnectedToNetwork() else {
            errorMessage = localisedString(key: LocalizableStringConstants.noInternet)
            return
        }
        movieService.getMovies(title: title)
            .receive(on: RunLoop.main)
            .sink { [weak self] error in
                guard let weakSelf = self else { return }
                switch error {
                case .finished: break
                case .failure(let error):
                    weakSelf.handleError(error: error)
                }
            } receiveValue: {[weak self] movies in
                guard let weakSelf = self else { return }
                weakSelf.movies = movies.search
            }
            .store(in: &cancellables)
    }
    
    func fetchMovie(id: String) {
        guard Network.isConnectedToNetwork() else {
            errorMessage = localisedString(key: LocalizableStringConstants.noInternet)
            return
        }
        movieService.getMovie(id: id)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                guard let weakSelf = self else { return }
                switch completion {
                case .finished: break
                case .failure(let error):
                    weakSelf.handleError(error: error)
                }
            } receiveValue: {[weak self] movie in
                guard let weakSelf = self else { return }
                weakSelf.movieDetails = movie
            }
            .store(in: &cancellables)
    }
    
    private func handleError(error: Error) {
        if let decodingError = error as? DecodingError {
            switch decodingError {
            case .typeMismatch(_, let context):
                errorMessage = "Key \"\(context.codingPath.first?.stringValue ?? "")\" " +  context.debugDescription
            case .valueNotFound(_, let context):
                errorMessage = context.debugDescription
            case .keyNotFound(_, let context):
                errorMessage = context.debugDescription
            case .dataCorrupted(let context):
                errorMessage = context.debugDescription
            @unknown default:
                errorMessage = "Some Decoding Error"
            }
        } else {
            errorMessage = error.localizedDescription
        }
    }
    
    @objc func statusManager(_ notification: Notification) {
        guard let reachability  = notification.object as? Reachability else { return }
        if reachability.status == .unreachable {
            print("No Network")
        }
    }
}
