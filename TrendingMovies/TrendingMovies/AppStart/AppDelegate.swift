//
//  AppDelegate.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /// Criando o controlador de navegação principal do aplicativo
        let navController = BaseNavigationController()

        /// Enviando para o coordenador para que ele possa exibir os viewControllers
        coordinator = AppCoordinator(navigationController: navController)

        /// Coordenador assume o controle
        coordinator?.start()

        /// Criando uma UIWindow e ativando
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }
}

