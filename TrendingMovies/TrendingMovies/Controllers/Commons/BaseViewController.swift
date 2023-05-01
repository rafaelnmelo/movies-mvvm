//
//  BaseViewController.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 01/05/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    var coordinator: AppCoordinator?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
