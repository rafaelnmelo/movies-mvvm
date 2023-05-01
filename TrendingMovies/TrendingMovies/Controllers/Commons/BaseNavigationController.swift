//
//  BaseNavigationController.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 01/05/23.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
