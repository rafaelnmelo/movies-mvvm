//
//  MovieDetailsViewModel.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 18/04/23.
//

import Foundation

class MovieDetailsViewModel {
    
    var movie: Movie
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        self.movieID = movie.id ?? 0
        
        if let title = movie.title, !title.isEmpty {
            self.movieTitle = title
        } else if let name = movie.name, !name.isEmpty {
            self.movieTitle = name
        } else {
            self.movieTitle = "[Sem título]"
        }
        
        if let desc = movie.overview, !desc.isEmpty {
            self.movieDescription = desc
        } else {
            self.movieDescription = "[Sem descrição no momento]"
        }
        
        self.movieImage = (NetworkConstant.shared.imageServerAddress + (movie.posterPath ?? "")).makeURL()
    }
}
