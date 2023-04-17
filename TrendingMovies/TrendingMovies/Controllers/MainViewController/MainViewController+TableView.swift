//
//  MainViewController+TableView.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.backgroundColor = .clear
        
        registerCells()
    }
    
    func registerCells() {
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movieData = cellDataSource[indexPath.row]
        cell.textLabel?.text = self.viewModel.getMovieTitle(movieData)
        return cell
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}
