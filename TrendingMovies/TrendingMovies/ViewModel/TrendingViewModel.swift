//
//  TrendingViewModel.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import Foundation
import RxSwift
import Differentiator

class TrendingViewModel {
    
    var dataSource = BehaviorSubject(value: [SectionModel(model: "", items: [Movie]())])
    
    func getData() {
        APICaller.getTrendingMovies { [weak self] result in          
            switch result {
            case .success(let movieList):
                guard let movies = movieList.results else {return}
                let trendingSection = SectionModel(model: "Trending", items: movies)
                ///Emitindo evento com novo valor
                self?.dataSource.on(.next([trendingSection]))
            case .failure(let error):
                self?.dataSource.onError(error)
            }
        }
    }
}
