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
        
        guard let url = URL(string: NetworkConstant.shared.trendingMovies) else {
            callback(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            print(dataResponse?.prettyPrintedJSON ?? "")
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
