//
//  MainViewController.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import UIKit

//MARK: - CLASS -
class MainViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel = MainViewModel()
    var coordinator: AppCoordinator?
    
    var cellDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configView()
        self.bindViewModel()
    }
    
    func configView() {
        self.title = "Tendências de Hoje"
        self.setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
}

//MARK: - FUNCTIONS -
extension MainViewController {
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {return}
            
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movieList in
            guard let self = self, let movieList = movieList else {return}
            self.cellDataSource = movieList
            self.reloadTableView()
            
        }
    }
    
    func createVCToNavigate(movieId: Int) {
        guard let movie = viewModel.retriveMovie(with: movieId) else {return}
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        DispatchQueue.main.async {
            self.coordinator?.goToDetails(viewModel: detailsViewModel)
        }
    }
}
