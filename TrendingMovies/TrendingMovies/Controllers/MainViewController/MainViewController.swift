//
//  MainViewController.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
        self.title = "Main View"
        setupTableView()
    }

}
