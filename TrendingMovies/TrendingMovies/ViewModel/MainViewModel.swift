//
//  MainViewModel.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import Foundation

class MainViewModel {
    
    var isLoading = Observable(false)
    var cellDataSource: Observable<[Movie]> = Observable(nil)
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results?.count ?? 0
    }

    func getData() {
        if isLoading.value ?? true {return}
        isLoading.value = true
        
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let movieList):
                print("Top trending Counts: \(movieList.results?.count ?? 0)")
                self?.dataSource = movieList
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results ?? []
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        movie.title ?? movie.originalTitle ?? "[Sem título]"
    }
}
