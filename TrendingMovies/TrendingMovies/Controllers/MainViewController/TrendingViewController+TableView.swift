//
//  TrendingViewController+TableView.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa

extension TrendingViewController: UITableViewDelegate {
    func bindTableView() {
        /// Set delegate ao rx
        tableview.rx.setDelegate(self).disposed(by: bag)
        
        /// Usando Rx para manejo do datasource
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String,Movie>> {
            _ ,tableview,indexPath, item in
            let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell.identifier,
                                                     for: indexPath) as! MovieCell
            let data = MovieCellViewModel(movieData: item)
            cell.setupCell(viewModel: data)
            return cell
        } titleForHeaderInSection: { dataSource, sectionIndex in
            dataSource[sectionIndex].model
        }
        
        /// Atrelando itens da tableview ao conjunto de objetos da viewModel
        self.viewModel.dataSource.bind(to: self.tableview.rx.items(dataSource: dataSource)).disposed(by: bag)
        
        /// Monitoramento de ação de seleção de itens na tableview
        tableview.rx.modelSelected(Movie.self).subscribe(onNext: {
            movie in
            let data = MovieDetailsViewModel(movie: movie)
            self.coordinator?.goToDetails(viewModel: data)
        })
        .disposed(by: bag)
    }
}
