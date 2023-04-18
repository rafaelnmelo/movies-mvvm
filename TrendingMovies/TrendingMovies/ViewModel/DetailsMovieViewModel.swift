//
//  DetailsMovieViewModel.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 18/04/23.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: Movie
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        self.movieID = movie.id ?? 0
        self.movieTitle = movie.title ?? movie.name ?? "[Sem título]"
        self.movieDescription = movie.overview ?? "[Sem descrição]"
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
