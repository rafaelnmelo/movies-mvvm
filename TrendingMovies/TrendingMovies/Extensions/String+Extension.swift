//
//  String+Extension.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 18/04/23.
//

import Foundation

extension String {
    func makeURL() -> URL? {
        URL(string: self)
    }
}
