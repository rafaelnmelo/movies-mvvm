//
//  MainViewController+TableView.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 14/04/23.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa

extension MainViewController: UITableViewDelegate {
    func bindTableView() {
        /// Set delegate ao rx
        tableview.rx.setDelegate(self).disposed(by: bag)
        /// Usando Rx para manejo do datasource
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String,Movie>> { _,tableview,indexPath, item in
            let cell = tableview.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath) as! MainMovieCell
            cell.setupCell(viewModel: MovieTableCellViewModel(movieData: item))
            return cell
        } titleForHeaderInSection: { dataSource, sectionIndex in
            dataSource[sectionIndex].model
        }
        /// Atrelando itens da tableview ao conjunto de objetos da viewModel
        self.viewModel.dataSource.bind(to: self.tableview.rx.items(dataSource: dataSource)).disposed(by: bag)
        
        /// Monitoramento de ação de exclusão de itens na tableview
//        tableview.rx.itemDeleted.subscribe(onNext: { [weak self] indexPath in
            /// Ações quando houver um evento de exclusão
//        }).disposed(by: bag)
        
        /// Monitoramento de ação de seleção de itens na tableview
//        tableview.rx.itemSelected.subscribe(onNext: { indexPath in
            /// Ações quando houver uma seleção
//        }).disposed(by: bag)
    }
}
