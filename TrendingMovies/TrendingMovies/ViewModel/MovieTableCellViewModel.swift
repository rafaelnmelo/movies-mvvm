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
        self.title = movieData.title ?? movieData.originalTitle ?? "[Sem titulo]"
        self.date = movieData.releaseDate ?? ""
        self.rating = "\(movieData.voteAverage ?? 0)/10"
        self.imageUrl = makeImageURL(movieData.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
