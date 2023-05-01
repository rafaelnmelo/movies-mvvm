//
//  ViewCodeProtocol.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 27/04/23.
//

import Foundation

protocol ViewCodeProtocol {
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

extension ViewCodeProtocol {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
}
