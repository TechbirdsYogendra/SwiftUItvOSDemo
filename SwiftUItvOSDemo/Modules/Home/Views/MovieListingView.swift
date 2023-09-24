//
//  MovieListingView.swift
//  SwiftUItvOSDemo
//
//  Created by Yogendra Singh on 24/09/23.
//

import SwiftUI

struct MovieListingView: View {
    
    @StateObject var viewModel = MoviesViewModel(movieService: MoviesService())
    
    var body: some View {
        NavigationStack {
            List(viewModel.movies, id: \.title) { movie in
                NavigationLink(value: movie) {
                    MovieView(movie: movie)
                        .cornerRadius(20)
                        .focusable()
                }
                .navigationDestination(for: Movie.self, destination: { movie in
                    MovieDetailsView(movie: movie)
                })
            }
        }
        .onAppear {
            viewModel.fetchMovies(title: "batman")
        }
    }
}

struct MovieListingView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListingView()
    }
}
