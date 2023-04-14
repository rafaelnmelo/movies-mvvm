//
//  MainViewModel.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import Foundation

class MainViewModel {
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        10
    }

    func getData() {
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let movieList):
                print("Top trending Counts: \(movieList.results?.count)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
