//
//  NetworkConstant.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import Foundation

class NetworkConstant {
    public static var shared = NetworkConstant()
    
    public var apiKey: String {
        get {
            "1e4ba8bbb5c77a2861e8a23414ce6aed&language=pt-BR"
        }
    }
    
    public var serverAddress: String {
        get {
            "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            "https://image.tmdb.org/t/p/w500/"
        }
    }
    
    public var trendingMovies: String {
        get {
            NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        }
    }
}
