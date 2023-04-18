//
//  MainViewModel.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import Foundation

class MainViewModel {
    
    var isLoading = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
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
                self?.dataSource = movieList
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results?.compactMap({ MovieTableCellViewModel(movieData: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        movie.title ?? movie.originalTitle ?? "[Sem título]"
    }
    
    func retriveMovie(with id: Int) -> Movie? {
        guard let movie = dataSource?.results?.first(where: {$0.id == id}) else {return nil}
        return movie
    }
}
