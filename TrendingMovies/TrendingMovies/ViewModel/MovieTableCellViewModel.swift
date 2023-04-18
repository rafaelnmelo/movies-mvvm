//
//  MovieTableCellViewModel.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 17/04/23.
//

import Foundation

class MovieTableCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movieData: Movie) {
        self.id = movieData.id ?? 0
        self.title = movieData.title ?? movieData.name ?? "[Sem titulo]"
        self.date = movieData.releaseDate ?? movieData.firstAirDate ?? "[Sem data de lançamento]"
        self.rating = "\(movieData.voteAverage ?? 0)/10"
        self.imageUrl = (NetworkConstant.shared.imageServerAddress + (movieData.posterPath ?? "")).makeURL()
    }
}
