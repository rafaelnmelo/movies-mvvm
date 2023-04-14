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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.addRootViewController()
        return true
    }
    
    func addRootViewController() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController(rootViewController: MainViewController())
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
        
        self.window = window
    }

}

