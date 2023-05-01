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

    func start()
}

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: BaseNavigationController
    
    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainViewController(nibName: nil, bundle: nil)
        vc.coordinator = self
        vc.title = "Destaques"
        navigationController.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToDetails(viewModel: DetailsMovieViewModel) {
        let vc = DetailsMovieViewController(viewModel: viewModel)
        vc.coordinator = self
        navigationController.title = "Detalhes"
        navigationController.pushViewController(vc, animated: true)
    }
}
