//
//  MovieDetailsView.swift
//  SwiftUItvOSDemo
//
//  Created by Yogendra Singh on 24/09/23.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @StateObject var viewModel = MoviesViewModel(movieService: MoviesService())
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            if let movieDetils = viewModel.movieDetails {
                HStack {
                    AsyncImage(url: URL(string: movieDetils.poster))
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text(movieDetils.title).font(.title3)
                        Text("Released:     \(movieDetils.released)").font(.body)
                        Text("Genre:        \(movieDetils.genre)").font(.body)
                        Text("Director:     \(movieDetils.director)").font(.body)
                        Text("Writer:        \(movieDetils.writer)").font(.body)
                        Text("Actors:     \(movieDetils.actors)").font(.body)
                    }
                    Spacer()
                }
                Spacer()
                Text(movieDetils.plot).font(.body)
                Spacer()
                Text("Languages:        \(movieDetils.language)").font(.body)
                Spacer()
                Text("Country:      \(movieDetils.country)").font(.body)
                Spacer()
                Text("Awards:       \(movieDetils.awards)").font(.body)
                Spacer()
            }
        }
        .onAppear{
            viewModel.fetchMovie(id: movie.imdbID)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(title: "Batman: Mystery of the Batwoman", year: "2003", imdbID: "tt0346578", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BN2IwYTVlZGQtOTRhNy00MDI5LThmMTUtYWI1MGUwMGFkYzI1XkEyXkFqcGdeQXVyNzQzNzQxNzI@._V1_SX300.jpg"))
    }
}
