//
//  APICaller.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(callback: @escaping (_ result: Result<TrendingMoviesModel,NetworkError>) -> Void) {
        let urlString = NetworkConstant.shared.serverAddress + NetworkConstant.shared.trendingMovies + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            callback(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            print(String(data: dataResponse!, encoding: .utf8)!)
            if error == nil,
               let data = dataResponse,
               let resulData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                callback(.success(resulData))
            } else {
                callback(.failure(.canNotParseData))
            }
        }.resume()
    }
}
