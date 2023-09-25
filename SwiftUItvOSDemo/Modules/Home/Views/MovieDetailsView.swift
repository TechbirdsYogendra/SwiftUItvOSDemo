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
                Text(movieDetils.title).font(.title3).foregroundColor(.yellow)
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: movieDetils.poster))
                        .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(movieDetils.runtime)  • \(movieDetils.genre)  • \(movieDetils.released)").font(.body)
                        Text("Country:      \(movieDetils.country)").font(.body)
                        Text("Director:     \(movieDetils.director)\nWriter:        \(movieDetils.writer)\nActors:     \(movieDetils.actors)").font(.body)
                    }
                }
                Spacer()
                MovieDetailsBottomView(movieDetils: movieDetils)
                Spacer()
            } else {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                } else {
                    Text(localisedString(key:LocalizableStringConstants.movieDetailsLoading))
                }
            }
        }
        .onAppear{
            viewModel.fetchMovie(id: movie.imdbID)
        }
    }
}

struct MovieDetailsBottomView: View {
    let movieDetils: MovieDetails
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(movieDetils.plot).font(.body)
            Text("Languages:        \(movieDetils.language)").font(.body)
            Text("Awards:       \(movieDetils.awards)").font(.body)
            Text("Box Office:     \(movieDetils.boxOffice)")
            Text("IMDb:     \(movieDetils.imdbRating)")
            if let rating = movieDetils.ratings.first {
                Text("\(rating.source):     \(rating.value)")
            }
            if let rating = movieDetils.ratings.last {
                Text("\(rating.source):     \(rating.value)")
            }
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(title: "Batman: Mystery of the Batwoman", year: "2003", imdbID: "tt0346578", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BN2IwYTVlZGQtOTRhNy00MDI5LThmMTUtYWI1MGUwMGFkYzI1XkEyXkFqcGdeQXVyNzQzNzQxNzI@._V1_SX300.jpg"))
    }
}
