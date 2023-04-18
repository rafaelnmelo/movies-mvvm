//
//  MainViewController+TableView.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import UIKit

//MARK: - FUNCTIONS -
extension MainViewController {
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self

        tableview.backgroundColor = .systemBackground

        registerCells()
    }

    func registerCells() {
        tableview.register(MainMovieCell.register(), forCellReuseIdentifier: MainMovieCell.identifier)
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}

//MARK: - DATASOURCE -
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier,
                                                       for: indexPath) as? MainMovieCell else {
            return UITableViewCell()
        }
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - DELEGATE -
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = cellDataSource[indexPath.row].id
        self.createVCToNavigate(movieId: movieId)
    }
}
