//
//  AppCoordinator.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 27/04/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainViewController(nibName: nil, bundle: nil)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToDetails(viewModel: DetailsMovieViewModel) {
        let vc = DetailsMovieViewController(viewModel: viewModel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
