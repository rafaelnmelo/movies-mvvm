//
//  AppCoordinator.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 27/04/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: BaseNavigationController { get set }
}

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: BaseNavigationController
    
    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = TrendingViewController(nibName: nil, bundle: nil)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToDetails(viewModel: MovieDetailsViewModel) {
        let vc = MovieDetailsViewController()
        vc.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }
}
