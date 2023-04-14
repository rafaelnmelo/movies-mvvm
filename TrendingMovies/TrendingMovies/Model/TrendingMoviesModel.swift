//
//  TrendingMoviesModel.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import Foundation

struct TrendingMoviesModel: Codable {
    let page: Int?
    let results: [Movie]?
    let totalResults: Int?
    let totalPages: Int?
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

struct Movie: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview,popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title,video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
