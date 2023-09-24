//
//  MovieView.swift
//  SwiftUItvOSDemo
//
//  Created by Yogendra Singh on 24/09/23.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    var body: some View {
        ZStack {
            Color.cyan
            HStack {
                AsyncImage(url: URL(string: movie.poster))
                    .cornerRadius(10)
                Spacer().frame(width: 20)
                VStack(alignment: .leading) {
                    Text(movie.title)
                    Text("Release Year: \(movie.year)")
                }
                Spacer()
            }
            .padding([.all], 20)
            .background(Color.red)
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: Movie(title: "Batman: Mystery of the Batwoman", year: "2003", imdbID: "tt0346578", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BN2IwYTVlZGQtOTRhNy00MDI5LThmMTUtYWI1MGUwMGFkYzI1XkEyXkFqcGdeQXVyNzQzNzQxNzI@._V1_SX300.jpg"))
    }
}
